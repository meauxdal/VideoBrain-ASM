import io
import csv
import json
from pathlib import Path
import sys
import unittest
import tempfile

sys.path.insert(0, str(Path(__file__).resolve().parent))
from diagnose_tennis import Trace, machine_summary, watches_from


class TennisDiagnosticTests(unittest.TestCase):
    def test_visits_and_bus_write(self):
        trace = Trace({0x1341: ['capture']}, Path('.'))
        events, log = io.StringIO(), io.StringIO()
        first = ('100 PC0=1341 PC1=1096 DC0=08F5 romc=00 ph=1 acc=02 '
                 'cycle=100 op=08 flags=10 j=10 irq=0\n')
        trace.consume(first, events, log)
        trace.consume(first, events, log)
        trace.consume(first.replace('romc=00', 'romc=05'), events, log)
        self.assertEqual(trace.counts['capture'], 1)
        rows = [json.loads(line) for line in events.getvalue().splitlines()]
        self.assertEqual([row['watch'] for row in rows], ['capture', 'memory-write-bus-phase'])
        self.assertEqual(trace.records, 3)
        self.assertEqual(log.getvalue(), '')

    def test_completion_and_limits(self):
        trace = Trace({}, Path('.'))
        events, log = io.StringIO(), io.StringIO()
        for line in ['done: 120 frames in 29000000 cycles\n',
                     '[trace-cpu limit reached]\n', 'NOTE: stopped on --max-cycles\n']:
            trace.consume(line, events, log)
        self.assertEqual(trace.done, 'done: 120 frames in 29000000 cycles')
        self.assertTrue(trace.trace_limit)
        self.assertTrue(trace.cycle_cap)

    def test_missing_symbols_fail_before_simulation(self):
        with self.assertRaises(KeyError):
            watches_from({}, bytes(4096))

    def test_passive_machine_events(self):
        columns = ['cycle', 'frame', 'kind', 'pc', 'vpos', 'field', 'addr', 'data']
        rows = [
            ['100', '8', 'pc-visit', '1341', '60', '0', '1341', '00'],
            ['110', '8', 'write', '1351', '61', '0', '0CDA', '46'],
            ['120', '9', 'write', '1351', '61', '1', '0CDA', 'DA'],
            ['130', '9', 'write', '1F00', '240', '1', '08F5', '01'],
        ]
        with tempfile.TemporaryDirectory(dir=Path(__file__).resolve().parent) as directory:
            path = Path(directory) / 'machine.csv'
            with path.open('w', newline='') as stream:
                writer = csv.writer(stream)
                writer.writerow(columns)
                writer.writerows(rows)
            result = machine_summary(path, {0x1341: ['capture']})
        self.assertEqual(result['watch_visits'], {'capture': 1})
        self.assertEqual(result['paddle_y_values']['0CDA'], [70, 218])
        self.assertEqual(result['selected_write_counts']['0CDA'], 2)
        self.assertEqual(result['raster_writes'][0]['vpos'], '240')


if __name__ == '__main__':
    unittest.main()
