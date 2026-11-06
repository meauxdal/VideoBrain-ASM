#!/usr/bin/env python3
"""Bounded Tennis trace collection using the existing headless simulator."""

import argparse
from collections import Counter, deque
import csv
import hashlib
import json
import os
from pathlib import Path
import re
import shlex
import shutil
import signal
import subprocess
import sys
import threading
import time

ASM_ROOT = Path(__file__).resolve().parents[2]
DEFAULT_CORE = ASM_ROOT.parent / 'VideoBrain_MiSTer'


def _core_root(argv):
    # vbc.py lives in the core repo; locate it before importing.
    for index, value in enumerate(argv):
        if value == '--core-root' and index + 1 < len(argv):
            return Path(argv[index + 1])
        if value.startswith('--core-root='):
            return Path(value.split('=', 1)[1])
    return DEFAULT_CORE


sys.path.insert(0, str(_core_root(sys.argv) / 'tools'))
from vbc import decode  # noqa: E402


class Trace:
    def __init__(self, watches, output):
        self.watches = watches
        self.output = output
        self.counts = Counter()
        self.pc_counts = Counter()
        self.last_pc = None
        self.records = 0
        self.tail = deque(maxlen=64)
        self.done = None
        self.trace_limit = False
        self.cycle_cap = False
        self.error = None
        self.frame = 0

    def consume(self, line, events, log):
        if ' PC0=' in line:
            self.records += 1
            fields = dict(re.findall(r'(\w+)=([0-9A-Fa-f]+)', line))
            pc = int(fields['PC0'], 16)
            fields['field_log_index'] = self.frame
            self.pc_counts[pc] += 1
            self.tail.append(line.rstrip())
            if pc != self.last_pc and pc in self.watches:
                for name in self.watches[pc]:
                    self.counts[name] += 1
                    events.write(json.dumps({'watch': name, 'pc': f'{pc:04X}',
                                             'sample': fields}) + '\n')
            if fields.get('romc') == '05' and int(fields['DC0'], 16) in {
                    0x8f0, 0x8f5, 0x8f7, 0xcda, 0xcde, 0xcea, 0xcec}:
                events.write(json.dumps({'watch': 'memory-write-bus-phase', 'sample': fields}) + '\n')
            self.last_pc = pc
            return
        log.write(line)
        if line.startswith('frame ') and 'hash ' in line:
            self.frame = int(line.split()[1]) + 1
            print(line.rstrip(), flush=True)
        if line.startswith('done:'):
            self.done = line.strip()
        self.trace_limit |= '[trace-cpu limit reached]' in line
        self.cycle_cap |= 'stopped on --max-cycles' in line

    def pump(self, stream):
        try:
            with (self.output / 'events.jsonl').open('w') as events, \
                    (self.output / 'sim.log').open('w') as log:
                for line in stream:
                    self.consume(line, events, log)
        except Exception as error:
            self.error = repr(error)


def symbols_from(path):
    return {name: int(value, 16) for name, value in
            re.findall(r'^(\w+)\s+([0-9a-f]{4})\b', path.read_text(), re.M | re.I)}


def watches_from(symbols, rom):
    names = ['PatentCartridgeStart', 'PatentCartridgeFrame', 'PatentFrameCompute',
             'PatentFrameWaitLine', 'PatentFrameButtons', 'PatentFrameEnable',
             'PatentPaddleCaptureUpdate', 'StockJoystickCapture', 'PatentGameStep',
             'PatentSceneUpdate', 'PatentDisplayPrepare', 'PatentDisplayCommit',
             'PatentStockInterrupt', 'PatentFieldService']
    # Field handler labels differ by revision: V2-V4 entry labels, V5+ wait loops.
    optional = ['PatentFieldGreen', 'PatentFieldRed', 'PatentFieldGreenWait',
                'PatentFieldRedWait', 'PatentFieldTransferWait']
    names += [name for name in optional if name in symbols]
    watches = {}
    for name in names:
        watches.setdefault(symbols[name], []).append(name)
    # Restrict call-site searches to code, never graphic data.
    ranges = [('PatentFrameCompute', 'PatentFrameButtons', 'PatentPaddleCaptureUpdate'),
              ('PatentPaddleCaptureUpdate', 'PatentBallAdvance', 'StockJoystickCapture')]
    for begin, end, target in ranges:
        start = symbols[begin] - 0x1000
        stop = symbols[end] - 0x1000
        if not 0 <= start < stop <= len(rom):
            raise ValueError(f'Invalid code range {begin}..{end}')
        address = symbols[target]
        opcode = bytes([0x28, address >> 8, address & 255])
        sites = [i for i in range(start, stop - 2) if rom[i:i + 3] == opcode]
        expected = 2 if target == 'PatentPaddleCaptureUpdate' else 1
        if len(sites) != expected:
            raise ValueError(f'Expected {expected} call sites for {target}, got {sites}')
        for index, site in enumerate(sites):
            watches.setdefault(site + 0x1003, []).append(f'{target}.return{index + 1}')
    return watches


def machine_summary(path, watches):
    counts = Counter()
    writes = Counter()
    paddles = {0xcda: set(), 0xcde: set()}
    raster = []
    last_state = {}
    with path.open() as stream:
        for row in csv.DictReader(stream):
            if row['kind'] == 'pc-visit':
                for name in watches.get(int(row['pc'], 16), []):
                    counts[name] += 1
            if row['kind'] != 'write':
                continue
            address, value = int(row['addr'], 16), int(row['data'], 16)
            writes[address] += 1
            if address in paddles:
                paddles[address].add(value)
            if 0xce0 <= address <= 0xcf4:
                last_state[f'{address:04X}'] = value
            if address in {0x8f0, 0x8f5}:
                raster.append({key: row[key] for key in ['cycle', 'frame', 'vpos', 'field', 'addr', 'data']})
    return {'watch_visits': dict(counts), 'paddle_y_values': {
                f'{address:04X}': sorted(values) for address, values in paddles.items()},
            'raster_writes': raster, 'last_game_state_writes': last_state,
            'selected_write_counts': {f'{address:04X}': writes[address]
                                      for address in [0x8f0, 0x8f5, 0x8f7, 0xcda, 0xcde, 0xcea, 0xcec, 0xd09]}}


def scenario_inputs(scenario, frames):
    if scenario == 'paddles':
        return ['--joy-pot', '0:16@40:16', '--joy-pot', '0:240@56:16',
                '--joy-pot', '2:240@40:16', '--joy-pot', '2:16@56:16',
                '--joy', 'FIRE@76:8', '--joy2', 'FIRE@88:8',
                '--shot', '38,39,54,55,70,71,94,95,' + str(frames - 1)]
    # Rally: paddles untouched (centre volley); both serve buttons pulse, read only in READY.
    inputs = []
    for start in range(40, frames - 8, 20):
        inputs += ['--joy', f'FIRE@{start}:4', '--joy2', f'FIRE@{start}:4']
    return inputs + ['--shot-every', '25', '--shot-last']


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ['sim', 'rom', 'symbols', 'out']:
        parser.add_argument('--' + name, required=True, type=Path)
    parser.add_argument('--frames', type=int, default=120)
    parser.add_argument('--minutes', type=int, default=45)
    parser.add_argument('--container', type=Path)
    parser.add_argument('--core-root', type=Path, default=DEFAULT_CORE)
    parser.add_argument('--scenario', choices=['paddles', 'rally'], default='paddles')
    args = parser.parse_args()
    root = args.core_root.resolve()
    output = args.out.resolve()
    output.mkdir(parents=True, exist_ok=True)
    summary_path = output / 'summary.json'
    if summary_path.exists():
        parser.error('Output already contains summary.json; use a fresh directory')
    summary = {'status': 'preflight', 'note': 'PC watches are bus PC visits, not instruction retirement counts.'}
    summary_path.write_text(json.dumps(summary, indent=2) + '\n')
    try:
        if not 80 <= args.frames <= 1000 or not 1 <= args.minutes <= 180:
            raise ValueError('Frames must be 80..1000 and minutes 1..180')
        cart = args.container or ASM_ROOT / 'local/tennis/tennis-adaptation-v4.vbc'
        res1 = root / 'software/0 BIOS/VideoBrain - RES1 (USA).bin'
        res2 = root / 'software/0 BIOS/VideoBrain - RES2 (USA).bin'
        files = [args.sim, args.rom, args.symbols, cart, res1, res2, Path(__file__)]
        summary['sha256'] = {str(path): hashlib.sha256(path.read_bytes()).hexdigest() for path in files}
        rom = args.rom.read_bytes()
        if len(rom) != 4096 or dict(decode(cart.read_bytes()).chunks)[b'ROM '] != rom:
            raise ValueError('Fresh assembly differs from selected VBC. Select/package the intended revision first.')
        watches = watches_from(symbols_from(args.symbols), rom)
        summary['watches'] = {f'{pc:04X}': names for pc, names in watches.items()}
        help_result = subprocess.run([str(args.sim), '--help'], capture_output=True, text=True, timeout=10)
        help_text = help_result.stdout + help_result.stderr
        (output / 'sim-help.txt').write_text(help_text)
        for option in ['--trace-cpu', '--joy-pot', '--joy2', '--joy-trace', '--probe']:
            if option not in help_text:
                raise ValueError(f'Simulator lacks {option}; rebuild headless before running')
        stdbuf = shutil.which('stdbuf')
        if not stdbuf:
            raise ValueError('Missing stdbuf for line-buffered partial results')
        command = [stdbuf, '-oL', str(args.sim), '--res1', str(res1), '--res2', str(res2),
                   '--cart', str(cart), '--cart-type', '0', '--frames', str(args.frames),
                   '--max-cycles', str((args.frames + 4) * 250000),
                   '--frame-log', '--probe', '--press', 'SPACE@20:8']
        command += scenario_inputs(args.scenario, args.frames)
        command += ['--outdir', str(output), '--prefix', 'tennis']
        machine_path = output / 'machine.csv'
        machine_mode = '--machine-trace' in help_text
        if machine_mode:
            command += ['--machine-trace', str(machine_path)]
            for pc in watches:
                command += ['--watch-pc', f'{pc:04X}']
        else:
            command += ['--trace-from', '0', '--trace-cpu', '10000000', '--joy-trace', '0']
        summary['command'] = command
        (output / 'command.txt').write_text(shlex.join(command) + '\n')
        trace = Trace(watches, output)
        started = time.monotonic()
        print(f'Results: {output}\nWall limit: {args.minutes} minutes', flush=True)
        with (output / 'sim.err').open('w') as errors:
            child = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=errors, text=True,
                                     errors='replace', start_new_session=True)
            summary.update(status='running', pid=child.pid)
            summary_path.write_text(json.dumps(summary, indent=2) + '\n')
            reader = threading.Thread(target=trace.pump, args=(child.stdout,), daemon=True)
            reader.start()
            try:
                code = child.wait(timeout=args.minutes * 60)
                summary['status'] = 'completed' if code == 0 else 'simulator-error'
            except (subprocess.TimeoutExpired, KeyboardInterrupt) as error:
                summary['status'] = 'timeout' if isinstance(error, subprocess.TimeoutExpired) else 'interrupted'
                os.killpg(child.pid, signal.SIGKILL)
                code = child.wait()
            reader.join(timeout=10)
        summary.update(exit_code=code, elapsed_seconds=round(time.monotonic() - started, 2),
                       trace_records=trace.records, watch_visits=dict(trace.counts),
                       frequent_bus_pcs=[(f'{pc:04X}', count) for pc, count in trace.pc_counts.most_common(20)],
                       completion=trace.done, trace_limit=trace.trace_limit, cycle_cap=trace.cycle_cap,
                       reader_error=trace.error)
        (output / 'trace-tail.txt').write_text('\n'.join(trace.tail) + '\n')
        if machine_mode:
            summary['machine'] = machine_summary(machine_path, watches)
            summary['watch_visits'] = summary['machine']['watch_visits']
        completed_frames = re.search(r'done: (\d+) frames', trace.done or '')
        if summary['status'] == 'completed' and (not completed_frames or
                int(completed_frames[1]) < args.frames or trace.trace_limit or trace.cycle_cap or trace.error):
            summary['status'] = 'incomplete'
    except Exception as error:
        summary.update(status='error', error=str(error))
    summary_path.write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2), flush=True)
    return 0 if summary['status'] == 'completed' else 2


if __name__ == '__main__':
    raise SystemExit(main())
