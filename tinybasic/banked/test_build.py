import unittest
from pathlib import Path
import re

from build import instruction, relational_aliases


class InstructionTests(unittest.TestCase):
    def test_space_literal(self):
        self.assertEqual(instruction("        CI ' \t; BLANK ?"), '        CI $20')

    def test_semicolon_literal(self):
        self.assertEqual(instruction("        CI ';\t; STATEMENT ?"), '        CI $3B')

    def test_apostrophe_literal(self):
        self.assertEqual(instruction("        CI ''"), '        CI $27')

    def test_comment(self):
        self.assertEqual(instruction("LABEL   LI 72 ; BUFFER'S LENGTH"), 'LABEL   LI 72')

    def test_relational_aliases_share_symbol_handlers(self):
        source = (Path(__file__).parents[1] / 'baseline/tinybasic.f8').read_text()
        table = relational_aliases(source).split('TAB8\t\tEQU', 1)[1].split('PROMPT', 1)[0]
        entries = dict(re.findall(r'DC\s+"([^"]+)"[^\n]*\n\s*DC.W\s+(\w+)\+H8000', table))
        for alias, symbol in [('GE', '>='), ('GT', '>'), ('LE', '<='), ('LT', '<')]:
            with self.subTest(alias=alias):
                self.assertEqual(entries[alias], entries[symbol])
        self.assertTrue(table.index('"LT"') < table.index('XP17+H8000'))


if __name__ == '__main__':
    unittest.main()
