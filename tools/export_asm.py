#!/usr/bin/env python3
"""Package this repository's sources and disassemblies for sharing.

Each ASM item is assembled with DASM (or taken from a repo build script's
listing), then rewritten in the column layout of Sean Riddle's VideoBrain
disassemblies: LABEL: in a 16-column field, an upper-case mnemonic, and a
'; addr bytes' column at column 41, with the original comment after a tab.
Include files are flattened into one file per assembled unit, and resolved
conditional blocks are dropped. Every exported file is reassembled and must
reproduce the original binary byte for byte.

The item list lives in export/manifest.json. export/STATE.json records the
hash of every source and output so the next run reports what changed.
Output goes to build/export/ and is zipped as build/export/<name>-<date>.zip.

Usage: python tools/export_asm.py [--dasm tools/dasm.exe] [--skip-prebuild]
"""

import argparse
import datetime
import hashlib
import json
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile
import zlib
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
MANIFEST = REPO / 'export' / 'manifest.json'
STATE = REPO / 'export' / 'STATE.json'
OUT_ROOT = REPO / 'build' / 'export'

REGISTERS = {'a', 'w', 'j', 'h', 'k', 'q', 'ku', 'kl', 'qu', 'ql', 'is',
             'dc', 'dc0', 'dc1', 'pc0', 'pc1', 'p0', 'p', 's', 'i', 'd'}
DROP = {'processor', 'include', 'if', 'ifconst', 'ifnconst', 'else',
        'endif', 'eif', 'end', 'echo', 'err', 'list'}
EQUATES = {'=', 'equ', 'set', 'eqm'}
DATA = {'db': 'db', 'dc': 'db', 'dc.b': 'db', '.byte': 'db', 'byte': 'db',
        'db.b': 'db', 'dw': 'dw', 'dc.w': 'dw', '.word': 'dw', 'word': 'dw',
        'ds': 'ds', 'ds.b': 'ds', 'hex': 'hex', 'align': 'align'}
DIRECTIVES = {'org', 'rorg', 'rend', 'seg', 'seg.u', 'subroutine'}
LABEL_W = 16
INSN_W = 25

FILE_RE = re.compile(r'^------- FILE (.+?)(?: LEVEL (\d+))?(?: PASS \d+)?\s*$')
LINE_RE = re.compile(r'^\s*(\d+)\s+([0-9a-fA-F]{4,8}|\?\?\?\?)?(.*)$')


def split_comment(text):
    """Return (code, comment) splitting at the first ';' outside quotes."""
    i, quote = 0, None
    while i < len(text):
        c = text[i]
        if quote:
            if c == quote:
                quote = None
        elif c == '"':
            quote = c
        elif c == "'":
            i += 1  # DASM character constant: 'X
        elif c == ';':
            return text[:i].rstrip(), text[i:]
        i += 1
    return text.rstrip(), ''


def parse_listing(path):
    """Yield (file, line_no, addr, hex_bytes, skipped) for each listed line."""
    stack = []
    for raw in path.read_text(encoding='latin-1').splitlines():
        m = FILE_RE.match(raw)
        if m:
            name, level = m.group(1), m.group(2)
            if level is None:  # return to an outer file
                while stack and stack[-1] != name:
                    stack.pop()
                if not stack:
                    stack.append(name)
            else:
                del stack[int(level) - 1:]
                stack.append(name)
            continue
        m = LINE_RE.match(raw)
        if not m or not stack or m.group(1) == '0':
            continue  # line 0 is the include statement echoed in the new file
        rest = raw.split('\t')
        # Listing columns: 'line addr', '', bytes, '', ..., flag, source.
        addr = m.group(2)
        hexes = ''
        skipped = False
        if len(rest) >= 3:
            # Up to four bytes then '*'; a label may follow without a tab.
            h = re.match(r' {7}((?:[0-9a-f]{2} ?){1,4}\*?)', rest[2])
            hexes = h.group(1).strip() if h else ''
            skipped = any(f.startswith('  -') for f in rest[3:])
        yield stack[-1], int(m.group(1)), addr, hexes, skipped


class Resolver:
    def __init__(self, dirs):
        self.dirs = [Path(d) for d in dirs]
        self.cache = {}

    def lines(self, name):
        if name not in self.cache:
            for d in self.dirs:
                p = (d / name.strip('"'))
                if p.exists():
                    text = p.read_text(encoding='latin-1')
                    self.cache[name] = (p.resolve(), text.splitlines())
                    break
            else:
                raise SystemExit(f'cannot find listed file {name} in {self.dirs}')
        return self.cache[name]


def upper_registers(operands, symbols):
    parts = []
    for tok in re.split(r'(,)', operands):
        s = tok.strip()
        if s.lower() in REGISTERS and s not in symbols:
            tok = tok.replace(s, s.upper())
        parts.append(tok)
    out = ''.join(parts)
    # Lower-case hex literals, as in Sean's listings; values are unchanged.
    return re.sub(r'\$[0-9A-Fa-f]+', lambda m: m.group(0).lower(), out)


def strip_address_comment(comment, addr):
    """Drop an old '; 1012 2a 0f 8b' column left in a Sean-derived source."""
    if not addr:
        return comment
    m = re.match(r';\s*([0-9a-fA-F]{4})((?:\s+[0-9a-fA-F]{2})*)\s*(.*)$',
                 comment)
    if m and m.group(1).lower() == addr[-4:].lower():
        return m.group(3).strip()
    return comment


def convert(lst, resolver, symbols, header):
    out = list(header)
    pending = None  # label waiting to share a line with the next statement

    def flush():
        nonlocal pending
        if pending is not None:
            out.append(pending + ':')
            pending = None

    for name, n, addr, hexes, skipped in parse_listing(lst):
        if skipped:
            continue
        path, src = resolver.lines(name)
        text = src[n - 1].rstrip('\r\n') if n - 1 < len(src) else ''
        code, comment = split_comment(text)
        comment = comment.strip()
        if not code.strip():
            flush()
            out.append(comment)
            continue
        label = ''
        if not code[0].isspace():
            first, _, code = code.partition(' ')
            if '\t' in first:
                first, _, more = first.partition('\t')
                code = more + ' ' + code
            label = first.rstrip(':')
        fields = code.split(None, 1)
        op = fields[0] if fields else ''
        operands = fields[1].strip() if len(fields) > 1 else ''
        lop = op.lower()
        if lop in DROP:
            if comment:
                flush()
                out.append(comment)
            continue
        if label and lop in EQUATES:
            flush()
            operands = re.sub(r'\$[0-9A-Fa-f]+', lambda m: m.group(0).lower(),
                              operands)
            line = label.ljust(LABEL_W - 1) + ' ' + 'equ'.ljust(5) + operands
            out.append(line + ('\t' + comment if comment else ''))
            continue
        if label and not op:
            flush()
            pending = label
            if comment:
                out.append(label + ':\t' + comment)
                pending = None
            continue
        if label:
            flush()
            pending = label
        lead = (pending + ':') if pending is not None else ''
        pending = None
        if len(lead) >= LABEL_W:  # too long to share the line
            out.append(lead)
            lead = ''
        comment = strip_address_comment(comment, addr)
        lead = lead.ljust(LABEL_W) if len(lead) < LABEL_W else lead + ' '
        if lop in DATA or lop in DIRECTIVES:
            word = DATA.get(lop, lop)
            if lop in DIRECTIVES and not lead.strip():
                # Sean writes org in column 0; DASM would read it as a label.
                line = ' ' * LABEL_W + word.ljust(5) + operands
            else:
                line = lead + word.ljust(5) + operands
            if '"' not in line:
                line = re.sub(r'\$[0-9A-Fa-f]+',
                              lambda m: m.group(0).lower(), line)
            out.append(line.rstrip() + ('\t' + comment if comment else ''))
            continue
        # Instruction.
        insn = (op.upper().ljust(5) + upper_registers(operands, symbols)).rstrip()
        insn = insn.ljust(INSN_W - 1) + ' '
        if hexes.endswith('*'):
            raise SystemExit(f'{lst}:{name}:{n}: truncated bytes on an instruction')
        col = f'; {addr[-4:].lower()} {hexes}'.rstrip()
        out.append(lead + insn + col + ('\t' + comment if comment else ''))
    flush()
    return out


def read_symbols(sym):
    names = set()
    if sym.exists():
        for line in sym.read_text(encoding='latin-1').splitlines():
            if line and not line.startswith('---'):
                names.add(line.split()[0])
    return names


def dasm(exe, source, outdir, stem, cwd, includes=(), defines=()):
    binf, lst, sym = (outdir / f'{stem}.{e}' for e in ('bin', 'lst', 'sym'))
    cmd = [str(exe), str(source), '-f3', f'-o{binf}', f'-l{lst}', f'-s{sym}']
    cmd += [f'-I{i}' for i in includes] + [f'-D{d}' for d in defines]
    r = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True)
    if r.returncode != 0 or not binf.exists():
        raise SystemExit(f'DASM failed on {source}:\n{r.stdout}\n{r.stderr}')
    return binf, lst, sym


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def git_date(paths):
    rel = [str(p.relative_to(REPO)) for p in paths if REPO in p.parents]
    if not rel:
        return datetime.date.today()
    r = subprocess.run(['git', 'log', '-1', '--format=%cs', '--', *rel],
                       cwd=REPO, capture_output=True, text=True)
    stamp = r.stdout.strip()
    return datetime.date.fromisoformat(stamp) if stamp else datetime.date.today()


def write_crlf(path, lines):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(('\r\n'.join(lines) + '\r\n').encode('latin-1'))


def markdown_to_text(md):
    text = re.sub(r'\[([^\]]+)\]\(([^)]+)\)', r'\1 (\2)', md)
    text = re.sub(r'\*\*([^*]+)\*\*', r'\1', text)
    text = re.sub(r'`([^`]+)`', r'\1', text)
    text = re.sub(r'^```\w*\s*$', '', text, flags=re.M)
    return text.splitlines()


def export_asm(item, manifest, exe, work):
    cwd = REPO / item.get('cwd', '.')
    includes = [str(REPO / i) for i in item.get('includes', [])]
    defines = item.get('defines', [])
    stem = Path(item['out']).stem
    if 'listing' in item:
        lst = REPO / item['listing']
        binf = lst.with_suffix('.bin')
        sym = lst.with_suffix('.sym')
    else:
        binf, lst, sym = dasm(exe, item['source'], work, stem, cwd,
                              includes, defines)
    resolver = Resolver([cwd, *includes, lst.parent])
    # Pre-load every listed file so the date and hashes cover all sources.
    sources = []
    for name, *_ in parse_listing(lst):
        p, _ = resolver.lines(name)
        if p not in sources:
            sources.append(p)
    date = git_date(sources)
    verb = item.get('verb', 'disassembled by')
    header = [f";{item['title']}", '']
    header += [f";{verb} {manifest['credit']}",
               f';{date.month}/{date.day}/{date.year}', '']
    for note in item.get('notes', []):
        header.append(';' + note)
    if item.get('notes'):
        header.append('')
    header.append(' ' * LABEL_W + 'processor f8')
    for d in defines:
        k, _, v = d.partition('=')
        header.append(k.ljust(LABEL_W - 1) + ' equ  ' + (v or '1'))
    header.append('')
    lines = convert(lst, resolver, read_symbols(sym), header)
    out = OUT_ROOT / manifest['name'] / item['out']
    write_crlf(out, lines)
    # Reassemble the exported file and compare with the original binary.
    rbin, _, _ = dasm(exe, out, work, stem + '-check', out.parent)
    if rbin.read_bytes() != binf.read_bytes():
        raise SystemExit(f'{out} does not reassemble to {binf}')
    data = binf.read_bytes()
    return out, sources, f'{len(data)} bytes, CRC32 {zlib.crc32(data):08X}'


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument('--dasm', type=Path, default=REPO / 'tools' / 'dasm.exe')
    ap.add_argument('--skip-prebuild', action='store_true',
                    help='reuse existing build/ listings')
    args = ap.parse_args()
    exe = args.dasm.resolve()
    manifest = json.loads(MANIFEST.read_text(encoding='utf-8'))
    old = json.loads(STATE.read_text(encoding='utf-8')) if STATE.exists() else {}
    pkg = OUT_ROOT / manifest['name']
    pkg.mkdir(parents=True, exist_ok=True)
    for old_file in pkg.iterdir():  # keep the folder; a shell may sit in it
        shutil.rmtree(old_file) if old_file.is_dir() else old_file.unlink()

    if not args.skip_prebuild:
        for cmd in manifest.get('prebuild', []):
            cmd = [c.replace('{dasm}', str(exe)) for c in cmd]
            print('prebuild:', ' '.join(cmd))
            subprocess.run(cmd, cwd=REPO, check=True,
                           stdout=subprocess.DEVNULL)

    state, index = {}, []
    with tempfile.TemporaryDirectory() as tmp:
        work = Path(tmp)
        for item in manifest['items']:
            kind = item['kind']
            out = pkg / item['out']
            if kind == 'asm':
                out, sources, info = export_asm(item, manifest, exe, work)
            elif kind == 'copy':
                src = REPO / item['source']
                out.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(src, out)
                sources, info = [src], 'copied unchanged'
            elif kind == 'text':
                src = REPO / item['source']
                write_crlf(out, markdown_to_text(src.read_text(encoding='utf-8')))
                sources, info = [src], 'converted from Markdown'
            else:
                raise SystemExit(f'unknown kind {kind}')
            rel = out.relative_to(pkg).as_posix()
            src_hashes = {str(p.relative_to(REPO)).replace('\\', '/')
                          if REPO in p.parents else p.name: sha(p)[:16]
                          for p in sources}
            entry = {'sources': src_hashes, 'output': sha(out)[:16],
                     'info': info}
            prev = old.get('items', {}).get(rel)
            status = 'new' if prev is None else \
                'unchanged' if prev['output'] == entry['output'] else 'changed'
            print(f'{status:9} {rel}  ({info})')
            state[rel] = entry
            index.append((rel, item.get('title', ''), info))
        for rel in old.get('items', {}):
            if rel not in state:
                print(f'removed   {rel}')

    readme = [f"{manifest['name']} - VideoBrain sources and disassemblies",
              f"{manifest['credit']}", '']
    readme += manifest.get('readme', []) + ['', 'Files:', '']
    width = max(len(r) for r, _, _ in index)
    for rel, title, info in index:
        readme.append(f'{rel.ljust(width)}  {title}' + (f' [{info}]' if info else ''))
    write_crlf(pkg / 'README.txt', readme)

    stamp = datetime.date.today().strftime('%Y%m%d')
    zpath = OUT_ROOT / f"{manifest['name']}-{stamp}.zip"
    with zipfile.ZipFile(zpath, 'w', zipfile.ZIP_DEFLATED) as z:
        for p in sorted(pkg.rglob('*')):
            if p.is_file():
                z.write(p, p.relative_to(OUT_ROOT).as_posix())
    STATE.write_text(json.dumps({'exported': datetime.date.today().isoformat(),
                                 'items': state}, indent=1) + '\n',
                     encoding='utf-8')
    print(zpath)


if __name__ == '__main__':
    sys.exit(main())
