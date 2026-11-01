import unittest

from build import instruction


class InstructionTests(unittest.TestCase):
    def test_space_literal(self):
        self.assertEqual(instruction("        CI ' \t; BLANK ?"), '        CI $20')

    def test_semicolon_literal(self):
        self.assertEqual(instruction("        CI ';\t; STATEMENT ?"), '        CI $3B')

    def test_apostrophe_literal(self):
        self.assertEqual(instruction("        CI ''"), '        CI $27')

    def test_comment(self):
        self.assertEqual(instruction("LABEL   LI 72 ; BUFFER'S LENGTH"), 'LABEL   LI 72')


if __name__ == '__main__':
    unittest.main()
