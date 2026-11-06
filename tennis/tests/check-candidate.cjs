const assert = require('node:assert/strict');
const fs = require('node:fs');
const crypto = require('node:crypto');
const { execute } = require('./f8.cjs');
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
for (const [line, next, color] of [[52, 236, 2]]) {
  const event = execute(rom, symbols, 'PatentFieldService', [], { memory: { [fieldLine]: line, 0x8f0: 255 } });
  assert.equal(event.mem[0x8f0], next);
  assert.equal(event.mem[fieldLine], next);
  assert.equal(event.mem[0x8f5], color);
  assert.deepEqual(event.writes, [0x8f5, fieldLine, 0x8f0]);
}
for (const parity of [0, 128]) {
  const memory = { [fieldLine]: transferLine, 0x8f0: 255, 0x8fa: parity, 0xffa: 16, 0xffb: 1,
    0xffc: 12, 0xffd: 32, 0xffe: 12, 0xfff: 80 };
  for (let offset = 0; offset < 96; offset++) memory[0xc20 + offset] = (offset + 1) & 255;
  const event = execute(rom, symbols, 'PatentFieldService', [], { memory, systemRom, stepLimit: 10000 });
  const source = parity ? 0xc20 : 0xc50;
  assert.equal(event.mem[0x8f0], 52);
  assert.equal(event.mem[fieldLine], 52);
  assert.equal(event.mem[0x8f5], 1);
  for (let offset = 0; offset < 16; offset++) {
    assert.equal(event.mem[0x800 + offset], memory[source + offset]);
    assert.equal(event.mem[0x810 + offset], memory[source + 16 + offset]);
    assert.equal(event.mem[0x830 + offset], memory[source + 32 + offset]);
    assert.equal(event.mem[0x820 + offset], 0xa5, 'BIOS transfer must leave DX unchanged');
  }
}
for (const lines of [[170, 171, 52, 56], [170, 171, 52, 60], [52, 60], [56]]) {
  let waits = 0;
  const waited = execute(rom, symbols, 'PatentFrameWaitLine', [0, 56], {
    observe: context => {
      if (![symbols.PatentFrameWaitWrap, symbols.PatentFrameWaitLoop].includes(context.pc)) return;
      assert.equal(context.w & 16, 16, 'raster IRQs must run during a missed-scanline wait');
      assert(waits < lines.length, 'wait must finish after crossing its target');
      context.mem[0x8fb] = lines[waits++];
    },
  });
  assert.equal(waits, lines.length);
  assert.equal(waited.w & 16, 0);
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
}
assert(points >= 1, 'combined control/game/scene path must score');
console.log(`Cartridge: 4,096 bytes; ${0x2000 - symbols.PatentCartridgeEnd} padding bytes; stock header and vector checked.`);
console.log('Transport: capture bytes match retail; interrupt wrapper changes only the dispatch call target.');
console.log(`Raster: green at 52, red/BIOS transfer at ${transferLine}; both parities checked.`);
console.log('Raster service windows tolerate R3 clobbering in compute, sort and commit.');
console.log('Combined frame: 400 control/game/scene/commit frames select both vertical axes and score.');
console.log(`Largest instruction traces: compute ${maxComputeSteps}, prepare ${maxPrepareSteps}, commit ${maxCommitSteps} (capture/BIOS calls stubbed).`);
console.log('No scanline, arbitration or actual interrupt timing is modeled; sound is not connected.');
console.log(`SHA256: ${crypto.createHash('sha256').update(rom).digest('hex')}`);
