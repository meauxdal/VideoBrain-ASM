// Instruction-level checks for the isolated assembly module, without I/O timing.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const crypto = require('node:crypto');
const rom = fs.readFileSync(process.argv[2]);
const symbols = {};
for (const line of fs.readFileSync(process.argv[3], 'utf8').split(/\r?\n/)) {
  const row = line.match(/^(\w+)\s+([0-9a-f]{4})\b/i);
  if (row) symbols[row[1]] = parseInt(row[2], 16);
}
const images = rom.subarray(symbols.PatentLP1O - 0x1000, symbols.PatentRP2E - 0x1000 + 64);
assert.equal(images.length, 384);
assert.equal(crypto.createHash('sha256').update(images).digest('hex'),
  '4dff0ba5b7571b5024aead3f627ced1837359ecdbec2db2ff797bed4a0a5c43c');
console.log('Assets: all 384 paddle bytes match the selected reconstruction.');

const { execute: run } = require('./f8.cjs');
const execute = (label, inputs) => run(rom, symbols, label, inputs);

let checks = 0;
for (let sample = 0; sample <= 199; sample++) {
  const result = execute('PatentPaddleMapInput', [0, sample]);
  assert.equal(result.a, Math.max(70, Math.min(218, sample + 39)));
  assert.deepEqual(result.writes, []);
  checks++;
}
console.log('Input: all 200 patent MAP values produce the required 70-218 clamp.');

for (let side = 0; side < 2; side++) for (let image = 0; image < 2; image++) {
  for (let y = 0; y < 256; y++) {
    const result = execute('PatentPaddleUpdate', [side, y, image]);
    const centerY = Math.max(70, Math.min(218, y));
    const centerX = side ? 154 : 34;
    const slot = side + 1;
    const display = 0xc80 + slot * 4, body = 0xcd8 + side * 4;
    const drawX = centerX + (image ? (side ? -4 : 4) : 0);
    const read = (address, length) => [...result.mem.slice(address, address + length)];
    assert.deepEqual(read(display, 4), [drawX, image ? 8 : 4, centerY + 1, 16]);
    assert.deepEqual(read(body, 4), [centerX, 4, centerY, 16]);
    assert.equal(result.regs[0], side);
    assert.equal(result.regs[1], centerY);
    assert.equal(result.regs[2], image);
    assert.equal(result.regs[9], 0x5a, 'retail saved status J');
    assert.equal(result.mem[0x820 + slot], 0x41 + image);
    assert.equal(result.mem[0xc40 + slot], 32);
    assert.equal(result.mem[0xc70 + slot], 32);
    const prefix = `Patent${side ? 'RP' : 'LP'}${image + 1}`;
    const color = side ? 0x20 : 0xc0;
    for (const [field, low, high] of [['O', 0xc20, 0xc30], ['E', 0xc50, 0xc60]]) {
      const ptr = symbols[prefix + field];
      assert.equal(result.mem[low + slot], ptr & 255);
      assert.equal(result.mem[high + slot], (ptr >> 8) + color);
      assert(ptr >= 0x1000 && ptr + (image ? 64 : 32) <= 0x1000 + rom.length);
    }
    const allowed = [display, display + 1, display + 2, display + 3,
      body, body + 1, body + 2, body + 3,
      0xc20 + slot, 0xc30 + slot, 0xc50 + slot, 0xc60 + slot,
      0x820 + slot, 0xc40 + slot, 0xc70 + slot];
    assert.deepEqual([...result.writes].sort((a, b) => a - b), allowed.sort((a, b) => a - b));
    for (let reg = 14; reg < 64; reg++) assert.equal(result.regs[reg], 0x5a);
    checks++;
  }
}
console.log('Scene: 1,024 side/image/Y cases preserve fixed collision bodies and both field pointers.');

for (let side = 0; side < 2; side++) for (const center of [70, 144, 218]) {
  for (let delta = -19; delta <= 19; delta++) {
    const result = execute('PatentPaddleHit', [side, center + delta, center]);
    const vertical = delta <= -13 ? -0x256 : delta <= -5 ? -0x103 :
      delta <= 3 ? 0 : delta <= 11 ? 0x103 : 0x256;
    assert.equal(result.regs[4] | (result.regs[5] << 8), vertical & 65535);
    assert.equal(result.regs[6] | (result.regs[7] << 8), (side ? -0x180 : 0x180) & 65535);
    assert.deepEqual([...result.regs.slice(0, 3)], [side, center + delta, center]);
    assert.deepEqual(result.writes, []);
    checks++;
  }
}
console.log('Hits: 234 contacts cover all five angle bands, both sides and endpoint paddle positions.');
console.log(`Passed ${checks} assembled-routine cases. ISR timing and game integration remain separate checks.`);
