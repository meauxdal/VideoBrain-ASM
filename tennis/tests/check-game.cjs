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
const base = symbols.PATENT_BALL_STATE;
const state = result => [...result.mem.slice(base, base + 21)];
const bcd = number => Math.floor(number / 10) * 16 + number % 10;
for (let number = 0; number <= 15; number++) {
  const result = execute(rom, symbols, 'PatentScoreIncrement', [0, bcd(number)]);
  assert.equal(result.a, bcd(Math.min(15, number + 1)));
  assert.equal(result.regs[1], bcd(number));
  assert.equal(result.regs[9], 0x5a);
  assert.deepEqual(result.writes, []);
}

const digits = rom.subarray(symbols.PatentScoreDigits - 0x1000, symbols.PatentScoreDigits - 0x1000 + 70);
assert.equal(crypto.createHash('sha256').update(digits).digest('hex'),
  '193405f77db1c2b1ed3f96f1d9d395e569ee3cf1ddc26b0d1f416bf2e440ba59');
for (const side of [0, 1]) for (let number = 0; number <= 15; number++) {
  for (const j of [0, 16, 31]) {
    const memory = { [symbols.PATENT_GAME_LEFT_SCORE + side]: bcd(number),
      [symbols.PATENT_GAME_LEFT_SCORE + 1 - side]: bcd(15 - number) };
    const result = execute(rom, symbols, 'PatentScoreUpdate', [side],
      { biosStack: true, j, memory, sceneInterrupts: true });
    const bitmap = side ? 0xf6e : 0xf60, slot = 12 + side;
    const expected = [];
    for (let row = 0; row < 7; row++) {
      expected.push(digits[Math.floor(number / 10) * 7 + row], digits[(number % 10) * 7 + row]);
    }
    assert.deepEqual([...result.mem.slice(bitmap, bitmap + 14)], expected);
    assert.deepEqual([...result.mem.slice(0xcb0 + side * 4, 0xcb4 + side * 4)], [78 + side * 32, 8, 61, 3]);
    assert.equal(result.mem[0x820 + slot], 0x42);
    assert.equal(result.mem[0xc40 + slot], 7);
    assert.equal(result.mem[0xc70 + slot], 7);
    const allowed = Array.from({ length: 14 }, (_, i) => bitmap + i);
    allowed.push(...Array.from({ length: 4 }, (_, i) => 0xcb0 + side * 4 + i),
      0x820 + slot, 0xc40 + slot, 0xc70 + slot);
    for (const [low, high] of [[0xc20, 0xc30], [0xc50, 0xc60]]) {
      assert.equal(result.mem[low + slot], bitmap & 255);
      assert.equal(result.mem[high + slot], 15 + side * 32);
      allowed.push(low + slot, high + slot);
    }
    assert.deepEqual([...result.writes].sort((a, b) => a - b), allowed.sort((a, b) => a - b));
    assert.equal(result.regs[0], side);
    assert.equal(result.regs[9], j);
    assert.equal(result.w & 16, 0);
  }
}

function initial() {
  const result = execute(rom, symbols, 'PatentGameInit', [], { sceneInterrupts: true });
  const expected = [180, 144, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 60, 0, 0, 86, 255, 0, 7, 0, 0];
  assert.deepEqual(state(result), expected);
  for (const address of result.writes) assert(address >= base && address < base + 21);
  assert.equal(result.regs[9], 0x5a);
  return expected;
}

let frameChecks = 0;
function step(previous, buttons, leftY = 148, rightY = 148) {
  const memory = {};
  previous.forEach((value, index) => { memory[base + index] = value; });
  [34, 4, leftY, 16, 154, 4, rightY, 16].forEach((value, index) => { memory[0xcd8 + index] = value; });
  const result = execute(rom, symbols, 'PatentGameStep', [buttons],
    { biosStack: true, j: 16, memory, sceneInterrupts: true });
  const next = state(result);
  assert.equal(result.a, next[9]);
  assert.equal(result.regs[9], 16);
  assert.equal(result.w & 16, 0);
  const allowed = new Set(Array.from({ length: 21 }, (_, i) => base + i));
  if (next[9] & 64) {
    const side = next[0] < 94 ? 0 : 1;
    const direct = execute(rom, symbols, 'PatentPaddleUpdate', [side, side ? rightY : leftY, 0]);
    for (const address of direct.writes) { allowed.add(address); assert.equal(result.mem[address], direct.mem[address]); }
  }
  for (const address of result.writes) assert(allowed.has(address), `unexpected write ${address.toString(16)}`);
  frameChecks++;
  return next;
}

for (const server of [0, 1]) {
  let current = initial();
  current[11] = server;
  for (let frame = 1; frame <= 134; frame++) {
    current = step(current, 5);
    assert.equal(current[13], 0);
    assert.equal(current[14], 0);
    if (frame < 60) {
      assert.equal(current[10], 0);
      assert.equal(current[12], 60 - frame);
      assert.equal(current[16], 255);
    } else if (frame <= 90) {
      const moves = frame - 59;
      assert.equal(current[10], 1);
      assert.equal(current[15], server ? 103 + moves : 85 - moves);
      assert.equal(current[16], 202 - moves * 2);
      assert.equal(current[0], server ? 113 + moves : 75 - moves);
      assert.equal(current[1], 210 - moves * 2);
      assert.equal(current[17], Math.floor((moves - 1) / 7) % 2);
      assert.equal(current[20], Math.floor(moves / 7) % 2);
      assert.equal(current[18], 7 - moves % 7);
    } else if (frame < 134) {
      assert.equal(current[10], 2);
      assert.equal(current[15], server ? 134 : 54);
      assert.equal(current[16], 140 - (frame - 90) * 2);
      assert.equal(current[0], server ? 148 : 40);
      assert.equal(current[1], 148);
      assert.deepEqual(current.slice(4, 8), [0, 0, 0, 0]);
    } else {
      assert.equal(current[10], 3);
      assert.deepEqual(current.slice(15, 17), [94, 255]);
    }
  }
  for (const buttons of [0, server ? 1 : 4]) {
    current = step(current, buttons);
    assert.equal(current[10], 3);
    assert.equal(current[8], 4);
    assert.equal(current[9], 0);
  }
  const launched = step(current, server ? 4 : 1, 144, 144);
  assert.equal(launched[10], 4);
  assert.equal(launched[0], server ? 148 : 40);
  assert.deepEqual(launched.slice(4, 8), [3, 1, 128, server ? 254 : 1]);
  assert.equal(launched[8], 3);
  assert.equal(launched[9], 64);

  const waiting = step(current, 5, 70, 70);
  assert.equal(waiting[10], 4);
  assert.equal(waiting[0], server ? 149 : 39);
  assert.deepEqual(waiting.slice(4, 8), [0, 0, 0, 0]);
  const contacted = step(waiting, 0, 148, 148);
  assert.equal(contacted[9], 64);
  assert.equal(contacted[8], 3);
}

// Complete games: align only the server with Y=148. Every rally ends naturally
// past the opponent, exercising the same serve/rally/point path all 15 times.
for (const server of [0, 1]) {
  let current = initial(), points = 0, frame = 0;
  current[11] = server;
  for (; frame < 6000; frame++) {
    const previousMode = current[10];
    current = step(current, current[10] === 3 && points < 15 ? 5 : 0,
      server ? 70 : 148, server ? 148 : 70);
    if (current[9] & 6) {
      points++;
      assert.equal(previousMode, 4);
      assert.equal(current[10], 0);
      assert.equal(current[11], server);
      assert.equal(current[12], 60);
      assert.equal(current[13 + server], bcd(points));
      assert.equal(current[14 - server], 0);
      assert.equal(current[9], server ? 4 : 2);
    }
    if (points === 15 && current[10] === 3) break;
  }
  assert(frame < 6000, 'complete-game frame limit');
  assert.equal(points, 15);
  assert.equal(current[13 + server], 0x15);
  const wrongButton = step(current, server ? 1 : 4, server ? 70 : 148, server ? 148 : 70);
  assert.equal(wrongButton[10], 3);
  assert.equal(wrongButton[13 + server], 0x15);
  const restarted = step(wrongButton, server ? 4 : 1, 148, 148);
  assert.deepEqual(restarted.slice(13, 15), [0, 0]);
  assert.equal(restarted[10], 4);
  assert.equal(restarted[9], 64);
}
console.log('Scores: all 16 packed-decimal values, including 09->10 and saturation at 15.');
console.log('Score display: 96 side/value/status cases, both fields, colors, bounds and exact write sets.');
console.log('Serve: both 134-frame retrievals, seven-frame animation, delivery and exit coordinates.');
console.log('Buttons: wrong-side presses, held/both buttons, delayed paddle contact and valid restart.');
console.log(`Controller: ${frameChecks} assembled frames, including two natural 15-point games and restarts.`);
console.log('BIOS K-stack calls are boundary stubs; live display/input scheduling remains untested.');
