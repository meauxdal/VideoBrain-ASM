const assert = require('node:assert/strict');

// F3850 timing in half short-cycles (short cycle = 4 clocks; long = 3 halves).
// Branches cost more when taken. Approximate; ignores UV201 bus stalls.
function halfCycles(op, taken) {
  if (op <= 0x07 || op === 0x0a || op === 0x0b) return 2;
  if (op === 0x08 || op === 0x09 || (op >= 0x0d && op <= 0x11)) return 8;
  if (op === 0x0c) return 10;
  if (op >= 0x12 && op <= 0x15) return 2;
  if (op === 0x16 || op === 0x17) return 5;
  if (op === 0x1c || op === 0x1d) return 4;
  if (op >= 0x18 && op <= 0x1f) return 2;
  if (op >= 0x20 && op <= 0x25) return 5;
  if (op === 0x26 || op === 0x27) return 8;
  if (op === 0x28) return 13;
  if (op === 0x29) return 11;
  if (op === 0x2a) return 12;
  if (op === 0x2b) return 2;
  if (op === 0x2c) return 4;
  if (op >= 0x30 && op <= 0x3f) return 3;
  if (op >= 0x40 && op <= 0x7f) return 2;
  if ((op >= 0x80 && op <= 0x87) || (op >= 0x90 && op <= 0x9f)) return taken ? 7 : 6;
  if (op >= 0x88 && op <= 0x8e) return 5;
  if (op === 0x8f) return taken ? 5 : 4;
  if (op === 0xa0 || op === 0xa1 || op === 0xb0 || op === 0xb1) return 4;
  if (op >= 0xa0 && op <= 0xbf) return 8;
  if (op >= 0xd0 && op <= 0xdf) return 4;
  return 2;
}

// No interrupt is taken at the boundary after these (F3850): PK, LR P,K, LR P0,Q,
// LR W,J, POP, DI, EI, PI, JMP, OUT, OUTS 4-15. The BIOS K-stack stubs end in
// LR W,J + POP, so they neither add a window nor end a masked run.
const PRIVILEGED = new Set([0x09, 0x0c, 0x0d, 0x1a, 0x1b, 0x1c, 0x1d, 0x27, 0x28, 0x29,
  ...Array.from({ length: 12 }, (_, i) => 0xb4 + i)]);

// Implements only the instructions used here. Flag order matches f8_pack.vhd.
function execute(rom, symbols, label, inputs, options = {}) {
  const mem = new Uint8Array(65536).fill(0xa5);
  mem.set(rom, 0x1000);
  if (options.systemRom) mem.set(options.systemRom, 0x4000);
  for (const [address, value] of Object.entries(options.memory || {})) mem[Number(address)] = value;
  const regs = new Uint8Array(64).fill(0x5a);
  inputs.forEach((value, index) => { regs[index] = value; });
  const writes = [], ports = [];
  let pc = symbols[label], pc1 = 0xffff, a = inputs[0], dc = 0, dc1 = 0, is = 0, w = options.status || 0;
  const calls = [], stack = [];
  let halves = 0, maskedRun = 0, maskedMax = 0, runFrom = 0, maskedFrom = 0, lastAt = 0;
  const runs = [];
  if (options.j !== undefined) regs[9] = options.j;
  const getK = () => (regs[12] << 8) | regs[13];
  function setK(value) { regs[12] = value >> 8; regs[13] = value & 255; }
  function flags(value, carry = false) {
    w = (w & 16) | (value < 128 ? 1 : 0) | (carry ? 2 : 0) | (value === 0 ? 4 : 0);
  }
  function add(value) {
    const sum = a + value;
    a = sum & 255;
    flags(a, sum > 255);
  }
  const fetch = () => mem[pc++];
  function account(op, taken, masked, at) {
    const cost = halfCycles(op, taken);
    halves += cost;
    if (masked) {
      if (!maskedRun) runFrom = at;
      lastAt = at;
      maskedRun += cost;
      if (maskedRun > maskedMax) { maskedMax = maskedRun; maskedFrom = runFrom; }
    } else {
      if (maskedRun) runs.push([runFrom, lastAt, maskedRun / 2, (halves - cost - maskedRun) / 2]);
      maskedRun = 0;
    }
  }
  function indirect(code) {
    const index = is;
    if (code === 13) is = (is & 56) | ((is + 1) & 7);
    if (code === 14) is = (is & 56) | ((is - 1) & 7);
    return index;
  }
  for (let steps = 0; steps < (options.stepLimit || 2000); steps++) {
    if (options.capture !== undefined && pc === symbols.StockJoystickCapture) {
      // Boundary stub: capture/calibration and BIOS K stack are not emulated.
      const axis = regs[10];
      calls.push({ label: 'capture', axis });
      for (const index of [8, 10, 11, 14, 15, 16, 17]) regs[index] = 0xcc;
      a = typeof options.capture === 'function' ? options.capture(axis) : options.capture;
      w = regs[9] & 31;
      pc = pc1;
      continue;
    }
    if (options.buttons !== undefined && pc === symbols.PatentFrameButtons) {
      calls.push({ label: 'buttons' });
      a = options.buttons;
      pc = pc1;
      continue;
    }
    if ((options.capture !== undefined || options.biosStack) && (pc === 0x40a9 || pc === 0x40bc)) {
      if (options.maskedStack) assert.equal(regs[9] & 16, 0, 'BIOS stack would enable interrupts');
      if (pc === 0x40a9) stack.push(getK());
      else { assert(stack.length, 'BIOS K stack underflow'); setK(stack.pop()); }
      w = regs[9] & 31;
      pc = pc1;
      continue;
    }
    if (options.observe) options.observe({ pc, w, mem, regs });
    const op = fetch(), startPc = pc;
    if (op >= 0x40 && op <= 0x4b) a = regs[op & 15];
    else if (op >= 0x4c && op <= 0x4e) a = regs[indirect(op & 15)];
    else if (op >= 0x50 && op <= 0x5b) regs[op & 15] = a;
    else if (op >= 0x5c && op <= 0x5e) regs[indirect(op & 15)] = a;
    else if (op >= 0x60 && op <= 0x67) is = ((op & 7) << 3) | (is & 7);
    else if (op >= 0x68 && op <= 0x6f) is = (is & 56) | (op & 7);
    else if (op >= 0x70 && op <= 0x7f) a = op & 15;
    else if (op >= 0xc0 && op <= 0xcb) add(regs[op & 15]);
    else if (op >= 0xcc && op <= 0xce) add(regs[indirect(op & 15)]);
    else if (op >= 0xf0 && op <= 0xfb) { a &= regs[op & 15]; flags(a); }
    else if (op >= 0x30 && op <= 0x3b) {
      const index = op & 15, old = a;
      a = regs[index]; add(255); regs[index] = a; a = old;
    } else if (op >= 0x3c && op <= 0x3e) {
      const index = indirect(op & 15), old = a;
      a = regs[index]; add(255); regs[index] = a; a = old;
    } else if (op >= 0xec && op <= 0xee) {
      a ^= regs[indirect(op & 15)]; flags(a);
    } else if (op >= 0x80 && op <= 0x87) {
      const base = pc, offset = fetch();
      if (w & (op & 7)) pc = base + (offset < 128 ? offset : offset - 256);
    } else if (op >= 0x90 && op <= 0x97) {
      const base = pc, offset = fetch();
      if (!(w & (op & 7))) pc = base + (offset < 128 ? offset : offset - 256);
    } else switch (op) {
      case 0x08: setK(pc1); break;
      case 0x1c: pc = pc1; break;
      case 0xb0: case 0xb1: ports.push([op & 1, a]); break;
      case 0x0a: a = is; break;
      case 0x0b: is = a & 63; break;
      case 0x10: dc = (regs[10] << 8) | regs[11]; break;
      case 0x0c:
        pc = getK();
        if (pc !== 0xffff) break;
        assert.equal(stack.length, 0, 'balanced BIOS K stack');
        account(op, false, true, startPc - 1);
        if (maskedRun) runs.push([runFrom, lastAt, maskedRun / 2, (halves - maskedRun) / 2]);
        return { a, regs, mem, writes, calls, ports, w, steps: steps + 1,
          cycles: halves / 2, maskedCycles: maskedMax / 2, maskedFrom, runs };
      case 0x12: a >>= 1; flags(a); break;
      case 0x13: a = (a << 1) & 255; flags(a); break;
      case 0x14: a >>= 4; flags(a); break;
      case 0x15: a = (a << 4) & 255; flags(a); break;
      case 0x16: a = mem[dc]; dc = (dc + 1) & 65535; break;
      case 0x17:
        if (options.sceneInterrupts) assert.equal(w & 16, 0, 'scene write with interrupts enabled');
        writes.push(dc); mem[dc] = a; dc = (dc + 1) & 65535; break;
      case 0x18: a ^= 255; flags(a); break;
      case 0x19: add(w & 2 ? 1 : 0); break;
      case 0x1a: w &= ~16; break;
      case 0x1b: w |= 16; break;
      case 0x1f: add(1); break;
      case 0x20: a = fetch(); break;
      case 0x21: a &= fetch(); flags(a); break;
      case 0x22: a |= fetch(); flags(a); break;
      case 0x23: a ^= fetch(); flags(a); break;
      case 0x24: add(fetch()); break;
      case 0x25: {
        const sum = (a ^ 255) + fetch() + 1;
        flags(sum & 255, sum > 255); break;
      }
      case 0x28: {
        const target = (fetch() << 8) | fetch();
        a = target >> 8; pc1 = pc; pc = target; break;
      }
      case 0x29: pc = (fetch() << 8) | fetch(); a = pc >> 8; break;
      case 0x2a: dc = (fetch() << 8) | fetch(); break;
      case 0x2b: break;
      case 0x2c: [dc, dc1] = [dc1, dc]; break;
      case 0x88: add(mem[dc]); dc = (dc + 1) & 65535; break;
      case 0x8a: a &= mem[dc]; dc = (dc + 1) & 65535; flags(a); break;
      case 0x8c: a ^= mem[dc]; dc = (dc + 1) & 65535; flags(a); break;
      case 0x8d: {
        const sum = (a ^ 255) + mem[dc] + 1;
        dc = (dc + 1) & 65535;
        flags(sum & 255, sum > 255); break;
      }
      case 0x8f: {
        const base = pc, offset = fetch();
        if ((is & 7) !== 7) pc = base + (offset < 128 ? offset : offset - 256);
        break;
      }
      case 0x8e: dc = (dc + (a < 128 ? a : a - 256)) & 65535; break;
      case 0xbe:
        if (options.smiControl) options.smiControl(a);
        else throw Error('SMI control outside test boundary');
        break;
      default: throw Error(`Unhandled opcode ${op.toString(16)} at ${(pc - 1).toString(16)}`);
    }
    account(op, pc !== startPc + ((op >= 0x80 && op <= 0x8f) || (op >= 0x90 && op <= 0x9f) ? 1 : 0), !(w & 16) || PRIVILEGED.has(op), startPc - 1);
  }
  throw Error('Instruction limit');
}

// VideoBrain CPU clock = 3.579545 MHz / 2; short cycle = 4 clocks; NTSC line = 1/15734.26 s (~28.4 cycles).
const CYCLES_PER_LINE = (3579545 / 2 / 4) * (1 / 15734.26);
module.exports = { execute, CYCLES_PER_LINE };
