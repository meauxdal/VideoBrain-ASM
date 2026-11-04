const assert = require('node:assert/strict');
const fs = require('node:fs');
const { execute } = require('./f8.cjs');
const rom = fs.readFileSync(process.argv[2]);
const symbols = {};
for (const line of fs.readFileSync(process.argv[3], 'utf8').split(/\r?\n/)) {
  const row = line.match(/^(\w+)\s+([0-9a-f]{4})\b/i);
  if (row) symbols[row[1]] = parseInt(row[2], 16);
}

// Keep the retained transport/calibration bytes identical at their new address.
const retail = fs.readFileSync(process.argv[4]);
assert.deepEqual(rom.subarray(symbols.StockJoystickCapture - 0x1000),
  retail.subarray(0xeed, 0xfcc));
console.log('Capture: all 223 stock transport/calibration bytes preserved.');

function expected(sample) {
  const clamped = Math.max(70, Math.min(214, sample));
  return clamped + Math.floor((clamped - 70) / 36);
}

for (let sample = 0; sample < 256; sample++) {
  const result = execute(rom, symbols, 'PatentPaddleMapStockInput', [0, sample]);
  assert.equal(result.a, expected(sample));
  assert.equal(result.regs[1], sample);
  assert.equal(result.regs[9], 0x5a);
  assert.deepEqual(result.writes, []);
}
console.log('Mapping: 256 inputs cover clamps, scale transitions and midpoint 142->144.');

let checks = 0;
for (let side = 0; side < 2; side++) for (let image = 0; image < 2; image++) {
  for (let sample = 0; sample < 256; sample++) for (const j of [0, 16, 31]) {
    const options = { capture: sample, j, status: j, sceneInterrupts: true };
    const inputs = [side, 0, image];
    const result = execute(rom, symbols, 'PatentPaddleCaptureUpdate', inputs, options);
    const y = expected(sample), slot = side + 1;
    const direct = execute(rom, symbols, 'PatentPaddleUpdate', [side, y, image]);
    assert.deepEqual(result.calls, [{ label: 'capture', axis: side * 2 }]);
    assert.equal(result.regs[0], side);
    assert.equal(result.regs[1], y);
    assert.equal(result.regs[2], image);
    assert.equal(result.regs[9], j, 'retail saved status J');
    assert.equal(result.w & 16, 0, 'return with interrupts disabled');
    assert.deepEqual(result.writes, direct.writes);
    for (const address of result.writes) assert.equal(result.mem[address], direct.mem[address]);
    const body = 0xcd8 + side * 4, display = 0xc80 + slot * 4;
    assert.equal(result.mem[body + 2], y);
    assert.equal(result.mem[display + 2], y + 1);
    for (let reg = 18; reg < 64; reg++) assert.equal(result.regs[reg], 0x5a);
    checks++;
  }
}
console.log(`Composition: ${checks} side/image/input/status cases select axes 0/2, preserve J,`);
console.log('balance K-stack calls and write only paddle records with interrupts disabled.');
console.log('Capture and BIOS stack calls use boundary stubs; ISR timing remains untested.');
