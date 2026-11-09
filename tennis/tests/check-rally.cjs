const assert = require('node:assert/strict');
const fs = require('node:fs');
const { execute } = require('./f8.cjs');
const rom = fs.readFileSync(process.argv[2]);
const symbols = {};
for (const line of fs.readFileSync(process.argv[3], 'utf8').split(/\r?\n/)) {
  const row = line.match(/^(\w+)\s+([0-9a-f]{4})\b/i);
  if (row) symbols[row[1]] = parseInt(row[2], 16);
}
const word = (regs, low, high) => regs[low] | (regs[high] << 8);
const velocities = [0, 1, 0xff, 0x100, 0x180, 0x256, 0xff80, 0xffff, 0xfe80, 0x8000, 0x7fff];
let motionChecks = 0, speedChecks = 0, collisionChecks = 0;
for (const x of [0, 0xff, 0x100, 0x3901, 0xe7ff, 0xffff]) {
  for (const vx of velocities) for (const vy of velocities) {
    const y = 65535 - x;
    const result = execute(rom, symbols, 'PatentBallAdvance',
      [x >> 8, y >> 8, x & 255, y & 255, vy & 255, vy >> 8, vx & 255, vx >> 8]);
    assert.equal(word(result.regs, 2, 0), (x + vx) & 65535);
    assert.equal(word(result.regs, 3, 1), (y + vy) & 65535);
    assert.equal(word(result.regs, 4, 5), vy);
    assert.equal(word(result.regs, 6, 7), vx);
    assert.equal(result.regs[9], 0x5a);
    assert.deepEqual(result.writes, []);
    motionChecks++;
  }
}

for (let count = 1; count <= 4; count++) for (const vx of velocities) for (const vy of velocities) {
  const result = execute(rom, symbols, 'PatentBallHitSpeed',
    [11, 22, 33, 44, vy & 255, vy >> 8, vx & 255, vx >> 8, count]);
  assert.equal(word(result.regs, 4, 5), (vy * (count === 1 ? 2 : 1)) & 65535);
  assert.equal(word(result.regs, 6, 7), (vx * (count === 1 ? 2 : 1)) & 65535);
  assert.equal(result.regs[8], Math.max(1, count - 1));
  assert.deepEqual([...result.regs.slice(0, 4)], [11, 22, 33, 44]);
  assert.equal(result.regs[9], 0x5a);
  assert.deepEqual(result.writes, []);
  speedChecks++;
}

// Numeric translation of the patent branches, independent of display rectangles.
function resolve(x, y, vy, vx, leftY, rightY) {
  let events = 0, side, paddleY;
  if (y < 57 || y > 231) { y = Math.max(57, Math.min(231, y)); vy = (-vy) & 65535; events |= 1; }
  if (x >= 92 && x <= 96) events |= 8;
  if (x >= 52 && x <= 93 && vx < 32768) events |= 16;
  if (x >= 94 && x <= 136 && vx >= 32768) events |= 32;
  if (x < 8) return { x: 8, y, vy, vx, events: events | 4 };
  if (x > 180) return { x: 180, y, vy, vx, events: events | 2 };
  if (x > 28 && x < 40) { side = 0; paddleY = leftY; }
  else if (x > 148 && x < 160) { side = 1; paddleY = rightY; }
  else return { x, y, vy, vx, events };
  const delta = y - paddleY;
  if (delta < -19 || delta > 19) return { x, y, vy, vx, events };
  // C11/C12 test only the velocity high byte; a positive fraction alone is zero there.
  if (delta === -19 && vy >= 256 && vy < 32768) {
    paddleY = Math.max(76, paddleY); y = paddleY - 19; vy = (-vy) & 65535; events |= 192;
  } else if (delta === 19 && vy >= 32768) {
    paddleY = Math.min(212, paddleY); y = paddleY + 19; vy = (-vy) & 65535; events |= 192;
  } else if (x <= 33) x = 28;
  else if (x > 154) x = 160;
  else {
    const angle = delta <= -13 ? -0x4ac : delta <= -5 ? -0x206 :
      delta <= 3 ? 0 : delta <= 11 ? 0x206 : 0x4ac;
    vy = angle & 65535; vx = (side ? -0x300 : 0x300) & 65535;
    x = side ? 148 : 40; events |= 64;
  }
  return { x, y, vy, vx, events, side, paddleY };
}

function check(x, y, vy, vx, leftY = 144, rightY = 144) {
  const inputs = [x, y, 0, 0, vy & 255, vy >> 8, vx & 255, vx >> 8];
  const options = { biosStack: true, maskedStack: true, j: 16, status: 0,
    memory: { 0xcda: leftY, 0xcde: rightY } };
  const result = execute(rom, symbols, 'PatentRallyResolve', inputs, options);
  const expected = resolve(x, y, vy, vx, leftY, rightY);
  const actual = { x: result.regs[0], y: result.regs[1], vy: word(result.regs, 4, 5),
    vx: word(result.regs, 6, 7), events: result.regs[3] };
  const base = { x: expected.x, y: expected.y, vy: expected.vy, vx: expected.vx, events: expected.events };
  assert.deepEqual(actual, base, JSON.stringify({ x, y, vy, vx, leftY, rightY }));
  if (expected.events & 64) {
    assert.equal(result.regs[10], expected.side);
    assert.equal(result.regs[2], expected.paddleY);
  }
  assert.equal(result.regs[9], 16);
  assert.equal(result.w & 16, 0);
  assert.deepEqual(result.writes, []);
  for (let reg = 14; reg < 64; reg++) assert.equal(result.regs[reg], 0x5a);
  collisionChecks++;
}

for (let y = 0; y < 256; y++) for (const vy of [0, 0x180, 0xfe80]) check(80, y, vy, 0x180);
for (let x = 0; x < 256; x++) for (const vx of [0x180, 0xfe80]) check(x, 144, 0x100, vx);
for (const center of [70, 76, 144, 212, 218]) {
  for (const x of [28, 29, 33, 34, 39, 40, 148, 149, 154, 155, 159, 160]) {
    for (const delta of [-20, -19, -18, -13, -12, -5, -4, 3, 4, 11, 12, 18, 19, 20]) {
      for (const vy of [0, 0x80, 0x100, 0xff80, 0xff00, 0x256]) {
        for (const vx of [0x180, 0xfe80]) check(x, center + delta, vy, vx, center, center);
      }
    }
  }
}

// Tunnelling: the loop runs at 30 Hz, so speeds are doubled (3 px/frame, 6 after the fourth hit) and the front window (5 px) is narrower than the top speed. Every rally X starts from a front hit at 40/148 and VX has no fraction, so the ball must still land in the opposite front window at both speeds.
let tunnelChecks = 0;
for (const side of [0, 1]) for (const vx of [0x300, 0x600]) for (let paddleY = 76; paddleY <= 212; paddleY++) {
  let x = side ? 148 : 40, step = side ? -(vx >> 8) : vx >> 8, hit = false;
  for (let frame = 0; frame < 100 && !hit; frame++) {
    x += step;
    const next = resolve(x, paddleY, 0, (side ? -vx : vx) & 65535, paddleY, paddleY);
    assert.equal(next.events & 6, 0, `ball tunnelled: ${JSON.stringify({ side, vx, paddleY, x })}`);
    hit = (next.events & 64) !== 0;
    x = next.x;
  }
  assert(hit);
  tunnelChecks++;
}

console.log(`Tunnelling: ${tunnelChecks} aligned returns at 3 and 6 px/frame land in the front window.`);
console.log(`Motion: ${motionChecks} signed 8.8 carry, fraction and wrap cases.`);
console.log(`Speed: ${speedChecks} hit-count and signed velocity doubling cases.`);
console.log(`Collision: ${collisionChecks} wall, exit, net, image, front, side and penetration cases.`);
console.log('Fixed paddle bodies are read without scene writes; J and return contracts preserved.');

const stateBase = symbols.PATENT_BALL_STATE;
const stateBytes = (x, y, vy, vx, hits, events = 0) =>
  [x >> 8, y >> 8, x & 255, y & 255, vy & 255, vy >> 8, vx & 255, vx >> 8, hits, events];
function memoryFor(state, leftY, rightY) {
  const memory = {};
  state.forEach((value, offset) => { memory[stateBase + offset] = value; });
  [34, 4, leftY, 16, 154, 4, rightY, 16].forEach((value, offset) => { memory[0xcd8 + offset] = value; });
  return memory;
}
for (const side of [0, 1]) {
  const result = execute(rom, symbols, 'PatentRallyStart', [side],
    { memory: memoryFor(new Array(10).fill(0xa5), 76, 212), status: 0 });
  assert.deepEqual([...result.mem.slice(stateBase, stateBase + 10)],
    stateBytes((side ? 148 : 40) << 8, (side ? 212 : 76) << 8, 0, side ? 0xfd00 : 0x300, 4));
  assert.deepEqual(result.writes, Array.from({ length: 10 }, (_, i) => stateBase + i));
}

let frameChecks = 0;
const traces = [
  { state: stateBytes(40 << 8, 144 << 8, 0, 0x180, 4), leftY: 144, rightY: 144, frames: 700 },
  { state: stateBytes(148 << 8, 218 << 8, 0, 0xfe80, 4), leftY: 70, rightY: 218, frames: 160 },
  { state: stateBytes(80 << 8, 57 << 8, 0xfe80, 0x180, 4), leftY: 144, rightY: 144, frames: 160 },
  { state: stateBytes(35 << 8, 57 << 8, 0x100, 0xfe80, 1), leftY: 76, rightY: 212, frames: 90 },
  { state: stateBytes((151 << 8) | 0x80, (231 << 8) | 0xff, 0xff00, 0x180, 1),
    leftY: 76, rightY: 212, frames: 90 },
];
for (const trace of traces) {
  let { state, leftY, rightY } = trace;
  for (let frame = 0; frame < trace.frames; frame++) {
    const x = ((state[0] << 8) + state[2] + (state[6] | (state[7] << 8))) & 65535;
    const y = ((state[1] << 8) + state[3] + (state[4] | (state[5] << 8))) & 65535;
    const next = resolve(x >> 8, y >> 8, state[4] | (state[5] << 8), state[6] | (state[7] << 8), leftY, rightY);
    let hits = state[8];
    if (next.events & 64) {
      if (--hits === 0) { hits = 1; next.vy = (next.vy * 2) & 65535; next.vx = (next.vx * 2) & 65535; }
    }
    const expected = stateBytes((next.x << 8) | (x & 255), (next.y << 8) | (y & 255),
      next.vy, next.vx, hits, next.events);
    const result = execute(rom, symbols, 'PatentRallyStep', [],
      { biosStack: true, j: 16, memory: memoryFor(state, leftY, rightY), sceneInterrupts: true });
    assert.deepEqual([...result.mem.slice(stateBase, stateBase + 10)], expected,
      `stateful frame ${frame}: ${JSON.stringify(state)}`);
    assert.equal(result.a, next.events);
    assert.equal(result.regs[9], 16);
    assert.equal(result.w & 16, 0);
    const allowed = new Set(Array.from({ length: 10 }, (_, i) => stateBase + i));
    if (next.events & 64) {
      const side = next.side;
      if (side) rightY = next.paddleY; else leftY = next.paddleY;
      const direct = execute(rom, symbols, 'PatentPaddleUpdate', [side, next.paddleY, 0]);
      for (const address of direct.writes) { allowed.add(address); assert.equal(result.mem[address], direct.mem[address]); }
    }
    for (const address of result.writes) assert(allowed.has(address), `unexpected write ${address.toString(16)}`);
    state = expected;
    frameChecks++;
    if (next.events & 6) break; // The serve/score controller owns the next frame.
  }
}
console.log(`State: both serve starts and ${frameChecks} consecutive rally frames preserve fractions,`);
console.log('apply hit progression and update paddle collision/drawing records together.');
console.log('BIOS K-stack calls are boundary stubs. Frame scheduling and integrated gameplay remain untested.');
