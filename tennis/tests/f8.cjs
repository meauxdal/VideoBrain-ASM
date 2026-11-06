const assert = require('node:assert/strict');

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
    const op = fetch();
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
        return { a, regs, mem, writes, calls, ports, w, steps: steps + 1 };
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
  }
  throw Error('Instruction limit');
}

module.exports = { execute };
