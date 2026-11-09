const assert = require('node:assert/strict');
const fs = require('node:fs');
const crypto = require('node:crypto');
const { execute, CYCLES_PER_LINE } = require('./f8.cjs');
const rom = fs.readFileSync(process.argv[2]);
const symbols = {};
for (const line of fs.readFileSync(process.argv[3], 'utf8').split(/\r?\n/)) {
  const row = line.match(/^(\w+)\s+([0-9a-f]{4})\b/i);
  if (row) symbols[row[1]] = parseInt(row[2], 16);
}
assert.equal(rom.length, 4096);
assert.deepEqual([...rom.subarray(0, 3)], [0xaa, 0x55, 1]);
assert.equal(symbols.PatentCartridgeStart, 0x1012);
assert(symbols.PatentCartridgeEnd <= 0x2000);
assert.equal(symbols.PatentStockInterrupt | 128, symbols.PatentStockInterrupt, '3853 external vector bit');
for (const retired of ['A1165', 'A12d5', 'A1736', 'A1b05', 'PatentPaddleMapInput', 'PatentRallyStart']) {
  assert.equal(symbols[retired], undefined, `retired/unneeded entry ${retired}`);
}
const retail = fs.readFileSync(process.argv[4]);
assert.equal(crypto.createHash('sha256').update(retail).digest('hex'),
  '4d8bafbffb31ab25532d493a0cba313eaa61a94d5f81e6b7f27cf8d881c85ccc');
const bytes = (name, length) => rom.subarray(symbols[name] - 0x1000, symbols[name] - 0x1000 + length);
assert.deepEqual(bytes('StockJoystickCapture', 223), retail.subarray(0xeed, 0xfcc));
const expectedInterrupt = Buffer.from(retail.subarray(0x1ff, 0x272));
assert.equal(expectedInterrupt[53], 0x28);
expectedInterrupt[54] = symbols.PatentFieldService >> 8;
expectedInterrupt[55] = symbols.PatentFieldService & 255;
assert.deepEqual(bytes('PatentStockInterrupt', 115), expectedInterrupt);
const systemRom = fs.readFileSync(process.argv[5]);
const transferLine = symbols.PATENT_FIELD_TRANSFER_LINE;
const fieldLine = symbols.PATENT_FIELD_LINE;
const greenIrq = symbols.PATENT_GREEN_IRQ, greenLine = symbols.PATENT_GREEN_LINE;
const redIrq = symbols.PATENT_RED_IRQ, redLine = symbols.PATENT_RED_LINE;
assert(greenIrq < greenLine && greenLine <= 52, 'green must land under the upper line');
assert(redIrq < redLine && redLine < transferLine, 'red precedes the transfer');
const waitLoops = ['PatentFieldGreenWait', 'PatentFieldRedWait', 'PatentFieldTransferWait'].map(n => symbols[n]);
// Each wait-loop visit advances VPOS one line from the IRQ arrival line.
function service(phase, arrival, memory = {}, options = {}) {
  let line = arrival, visits = 0, colorAt, transferAt;
  const event = execute(rom, symbols, 'PatentFieldService', [], {
    ...options,
    memory: { [fieldLine]: phase, 0x8f0: 255, 0x8f5: 0, 0x8fb: arrival & 255, ...memory },
    observe: context => {
      if (waitLoops.includes(context.pc) && visits++) context.mem[0x8fb] = ++line & 255;
      if (colorAt === undefined && context.mem[0x8f5]) colorAt = line;
      if (context.pc === 0x424d && transferAt === undefined) transferAt = line;
    },
  });
  return { event, colorAt, transferAt, visits };
}
for (const arrival of [greenIrq, greenIrq + 6, greenLine, greenLine + 9]) {
  const { event, colorAt } = service(greenIrq, arrival);
  assert.equal(colorAt, Math.max(arrival, greenLine), `green from IRQ at ${arrival}`);
  assert.equal(event.mem[0x8f5], 2);
  assert.equal(event.mem[0x8f0], redIrq);
  assert.equal(event.mem[fieldLine], redIrq);
  assert.deepEqual(event.writes, [0x8f5, fieldLine, 0x8f0]);
}
for (const parity of [0, 128]) {
  for (const arrival of [redIrq, redIrq + 8, redLine + 1, 262 + 3]) {
    const memory = { 0x8fa: parity, 0xffa: 16, 0xffb: 1, 0xffc: 12, 0xffd: 32, 0xffe: 12, 0xfff: 80 };
    for (let offset = 0; offset < 96; offset++) memory[0xc20 + offset] = (offset + 1) & 255;
    memory[symbols.PATENT_PADDLE_DX] = 0x42;
    memory[symbols.PATENT_PADDLE_DX + 1] = 0x41;
    const { event, colorAt, transferAt, visits } = service(redIrq, arrival, memory, { systemRom, stepLimit: 10000 });
    if (arrival > 255) {
      assert.equal(visits, 2, 'a wrapped late IRQ must not spin a whole field');
    } else {
      assert.equal(colorAt, Math.max(arrival, redLine), `red from IRQ at ${arrival}`);
      assert.equal(transferAt, Math.max(arrival, transferLine), `transfer from IRQ at ${arrival}`);
    }
    const source = parity ? 0xc20 : 0xc50;
    assert.equal(event.mem[0x8f0], greenIrq);
    assert.equal(event.mem[fieldLine], greenIrq);
    assert.equal(event.mem[0x8f5], 1);
    for (let offset = 0; offset < 16; offset++) {
      assert.equal(event.mem[0x800 + offset], memory[source + offset]);
      assert.equal(event.mem[0x810 + offset], memory[source + 16 + offset]);
      assert.equal(event.mem[0x830 + offset], memory[source + 32 + offset]);
      const dx = offset === 1 ? 0x42 : offset === 2 ? 0x41 : 0xa5;
      assert.equal(event.mem[0x820 + offset], dx, 'only cached paddle DX may change with the transfer');
    }
  }
}
const sound = symbols.PATENT_SOUND;
for (const lines of [[170, 171, 52, 56], [170, 171, 52, 60], [52, 60], [56]]) {
  let waits = 0;
  const waited = execute(rom, symbols, 'PatentFrameWaitLine', [0, 56], {
    memory: { [sound]: 0 },
    observe: context => {
      if (![symbols.PatentFrameWaitWrap, symbols.PatentFrameWaitLoop].includes(context.pc)) return;
      assert.equal(context.w & 16, 16, 'raster IRQs must run during a missed-scanline wait');
      assert(waits < lines.length, 'wait must finish after crossing its target');
      context.mem[0x8fb] = lines[waits++];
    },
  });
  assert.equal(waits, lines.length);
  assert.equal(waited.w & 16, 0);
  assert.deepEqual(waited.ports, [], 'silent waits must not touch the speaker');
}
{
  // A queued paddle-hit tone: 10 edges, one per 15 lines, while idling 170 -> 56.
  const lines = [];
  for (let line = 170; line < 256; line++) lines.push(line);
  for (let line = 0; line <= 56; line++) lines.push(line);
  let waits = 0, edgeLines = [];
  const waited = execute(rom, symbols, 'PatentFrameWaitLine', [0, 56], {
    memory: { [sound]: 10, [sound + 1]: 0, [sound + 2]: 256 - 14 },
    stepLimit: 20000,
    observe: context => {
      if ([symbols.PatentFrameWaitWrap, symbols.PatentFrameWaitLoop].includes(context.pc)) {
        context.mem[0x8fb] = lines[waits++];
      }
      if (context.pc === symbols.PatentSoundLevel) edgeLines.push(context.mem[0x8fb]);
    },
  });
  assert.equal(waits, lines.length);
  assert.equal(waited.mem[sound], 0);
  assert.deepEqual(edgeLines, [170, 185, 200, 215, 230, 245, 4, 19, 34, 49]);
  assert.equal(waited.ports.length, 30);
  for (let edge = 0; edge < 10; edge++) {
    assert.deepEqual(waited.ports.slice(edge * 3, edge * 3 + 3),
      [[1, 0x10], [0, (9 - edge) & 1 ? 7 : 0], [1, 0]]);
  }
}

function snapshot(result) {
  const memory = {};
  for (let address = 0xc00; address <= 0xfff; address++) memory[address] = result.mem[address];
  for (let address = 0x800; address <= 0x88f; address++) memory[address] = result.mem[address];
  return memory;
}
const initialized = execute(rom, symbols, 'PatentGameInit', []);
let memory = snapshot(initialized);
memory = snapshot(execute(rom, symbols, 'PatentSceneInit', [],
  { memory, biosStack: true, j: 0, sceneInterrupts: true, stepLimit: 10000 }));
memory = snapshot(execute(rom, symbols, 'PatentDisplayConfigure', [], { memory }));
const firstPrepared = execute(rom, symbols, 'PatentDisplayPrepare', [],
  { memory, biosStack: true, j: 0, stepLimit: 10000 });
memory = snapshot(firstPrepared);
memory = snapshot(execute(rom, symbols, 'PatentDisplayCommit', [...firstPrepared.regs],
  { memory, biosStack: true, j: 0, stepLimit: 10000 }));
let maxComputeSteps = 0, maxPrepareSteps = 0, maxCommitSteps = 0, points = 0;
const lines = { compute: [0, 0], prepare: [0, 0], commit: [0, 0] };
const track = (name, result) => {
  lines[name][0] = Math.max(lines[name][0], result.cycles / CYCLES_PER_LINE);
  if (result.maskedCycles / CYCLES_PER_LINE > lines[name][1]) {
    lines[name][1] = result.maskedCycles / CYCLES_PER_LINE; lines[name][2] = result.maskedFrom;
  }
};
for (let frame = 0; frame < 400; frame++) {
  const smiWrites = [];
  let smiEnabled = 1;
  const computed = execute(rom, symbols, 'PatentFrameCompute', [], {
    memory, capture: axis => {
      assert.equal(smiEnabled, 0, 'joystick IRQ must not dispatch a raster event');
      return axis === 0 ? 146 : 70;
    }, buttons: 3, j: 16, stepLimit: 10000, sceneInterrupts: true,
    observe: context => { if (context.w & 16) context.regs[3] = 0xd7; },
    smiControl: value => { smiEnabled = value; smiWrites.push(value); },
  });
  assert.deepEqual(smiWrites, [0, 1]);
  assert.deepEqual(computed.calls, [{ label: 'capture', axis: 0 }, { label: 'capture', axis: 2 }, { label: 'buttons' }]);
  assert.equal(computed.regs[9], 16);
  assert.equal(computed.w & 16, 0);
  assert.equal(computed.mem[0xcda], 148);
  assert.equal(computed.mem[0xcde], 70);
  if (computed.mem[symbols.PATENT_BALL_EVENTS] & 6) points++;
  assert.equal(computed.mem[symbols.PATENT_GAME_RIGHT_SCORE], 0);
  memory = snapshot(computed);
  const prepared = execute(rom, symbols, 'PatentDisplayPrepare', [],
    { memory, biosStack: true, j: 16, sceneInterrupts: true, stepLimit: 10000,
      observe: context => { if (context.w & 16) context.regs[3] = 0xd7; } });
  memory = snapshot(prepared);
  const committed = execute(rom, symbols, 'PatentDisplayCommit', [...prepared.regs],
    { memory, biosStack: true, j: 16, sceneInterrupts: true, stepLimit: 10000,
      observe: context => { if (context.w & 16) context.regs[3] = 0xd7; } });
  const origin = slot => (computed.mem[0xc80 + slot * 4] - computed.mem[0xc81 + slot * 4]) & 255;
  const order = Array.from({ length: 16 }, (_, slot) => slot)
    .sort((left, right) => origin(left) - origin(right) || left - right);
  for (let index = 0; index < 16; index++) {
    assert.equal(committed.mem[0x870 + index], committed.mem[0x880 + index]);
    assert.equal(committed.mem[0x850 + index], committed.mem[0x860 + index]);
    assert.equal(committed.mem[0x870 + index] & 15, order[index]);
  }
  memory = snapshot(committed);
  maxComputeSteps = Math.max(maxComputeSteps, computed.steps);
  maxPrepareSteps = Math.max(maxPrepareSteps, prepared.steps);
  maxCommitSteps = Math.max(maxCommitSteps, committed.steps);
  track("compute", computed); track("prepare", prepared); track("commit", committed);
  // MASK_LOG=1 lists every masked run over ~10 lines: start, end, cycles, start offset.
  if (process.env.MASK_LOG) for (const [name, r] of [["C", computed], ["P", prepared]]) for (const [s, e, c, at] of r.runs) if (c > 300) console.log("RUN", name, s.toString(16), e.toString(16), (c / CYCLES_PER_LINE).toFixed(1), (at / CYCLES_PER_LINE).toFixed(1));
}
assert(points >= 1, 'combined control/game/scene path must score');
console.log(`Cartridge: 4,096 bytes; ${0x2000 - symbols.PatentCartridgeEnd} padding bytes; stock header and vector checked.`);
console.log('Transport: capture bytes match retail; interrupt wrapper changes only the dispatch call target.');
console.log(`Raster: IRQ ${greenIrq}->green at ${greenLine}, IRQ ${redIrq}->red at ${redLine}, BIOS transfer at ${transferLine}; late/wrapped IRQs and both parities checked.`);
console.log('Raster service windows tolerate R3 clobbering in compute, sort and commit.');
console.log('Combined frame: 400 control/game/scene/commit frames select both vertical axes and score.');
console.log(`Largest instruction traces: compute ${maxComputeSteps}, prepare ${maxPrepareSteps}, commit ${maxCommitSteps} (capture/BIOS calls stubbed).`);
console.log('No scanline, arbitration or actual interrupt timing is modeled; sound edges are checked against a scripted VPOS.');
console.log(`SHA256: ${crypto.createHash('sha256').update(rom).digest('hex')}`);
console.log('Scanlines (total / longest masked run): ' + Object.entries(lines)
  .map(([name, [total, masked, from]]) =>
    `${name} ${total.toFixed(1)}/${masked.toFixed(1)} (from $${(from || 0).toString(16)})`).join(', ') + '.');
