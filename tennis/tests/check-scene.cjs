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
const assets = JSON.parse(fs.readFileSync(require('node:path').join(__dirname, 'scene-assets.json'), 'utf8'));
for (const asset of assets) {
  const bytes = rom.subarray(symbols[asset.Name] - 0x1000, symbols[asset.Name] - 0x1000 + asset.Bytes);
  assert.equal(bytes.length, asset.Bytes);
  assert.equal(crypto.createHash('sha256').update(bytes).digest('hex'), asset.SHA256);
}

function selection(x) {
  return x <= 33 ? 1 : x <= 43 ? 0 : x <= 94 ? 1 : x <= 144 ? 2 : x <= 154 ? 3 : 2;
}
for (let x = 0; x < 256; x++) {
  const result = execute(rom, symbols, 'PatentSceneSelect', [0, x]);
  assert.equal(result.a, selection(x));
  assert.deepEqual(result.writes, []);
}

function decode(result, slot, field = 0) {
  const { mem } = result;
  const body = 0xc80 + slot * 4;
  const height = mem[(field ? 0xc70 : 0xc40) + slot];
  // Paddle DX (slots 1/2) is cached and reaches $0821/$0822 with the field transfer.
  const dx = slot === 1 || slot === 2 ? mem[symbols.PATENT_PADDLE_DX + slot - 1] : mem[0x820 + slot];
  const width = dx & 31;
  const low = mem[(field ? 0xc50 : 0xc20) + slot];
  const high = mem[(field ? 0xc60 : 0xc30) + slot];
  return { x: (mem[body] - mem[body + 1]) & 255,
    y: ((mem[body + 2] - mem[body + 3]) & 255) + (mem[symbols.PATENT_SCENE_FLAGS + slot] ? 256 : 0),
    width, height, dx, pointer: low | ((high & 31) << 8), color: high & 0xe0 };
}
const sourceMemory = new Map();
const initialGame = execute(rom, symbols, 'PatentGameInit', []);
for (let address = 0xce0; address <= 0xcf4; address++) sourceMemory.set(address, initialGame.mem[address]);
const initialized = execute(rom, symbols, 'PatentSceneInit', [],
  { memory: Object.fromEntries(sourceMemory), biosStack: true, maskedStack: true, j: 0,
    sceneInterrupts: true, stepLimit: 10000 });
assert.equal(initialized.regs[9], 0);
assert.equal(initialized.w & 16, 0);
for (const slot of [4, 14, 15]) assert(decode(initialized, slot).y > 300);
for (const [slot, x, y, width, height] of [[7, 1, 50, 23, 4], [8, 1, 234, 23, 4],
  [9, 87, 54, 1, 60], [10, 87, 114, 1, 60], [11, 87, 174, 1, 60]]) {
  const actual = decode(initialized, slot);
  assert.deepEqual([actual.x, actual.y, actual.width, actual.height], [x, y, width, height]);
}
assert.equal(decode(initialized, 5).y, 511);
assert.equal(decode(initialized, 12).y, 58);
assert.equal(decode(initialized, 13).y, 58);
for (const side of [0, 1]) assert.equal(initialized.mem[0x821 + side], initialized.mem[symbols.PATENT_PADDLE_DX + side],
  'init applies cached paddle DX');

const baseMemory = {};
for (let address = 0xc20; address <= 0xd0b; address++) baseMemory[address] = initialized.mem[address];
for (let slot = 0; slot < 16; slot++) baseMemory[0x820 + slot] = initialized.mem[0x820 + slot];
const allowed = new Set();
for (const slot of [0, 1, 2, 3, 5, 6, 9, 10, 11, 12, 13]) {
  for (let i = 0; i < 4; i++) allowed.add(0xc80 + slot * 4 + i);
  for (const bank of [0xc20, 0xc30, 0xc40, 0xc50, 0xc60, 0xc70, 0x820]) allowed.add(bank + slot);
  allowed.add(symbols.PATENT_SCENE_FLAGS + slot);
}
allowed.add(symbols.PATENT_PADDLE_DX);
allowed.add(symbols.PATENT_PADDLE_DX + 1);
allowed.add(symbols.PATENT_SCENE_SELECTION);
allowed.add(symbols.PATENT_SCENE_SAVED_J);
allowed.add(symbols.PATENT_SCENE_SCORE_CACHE);
allowed.add(symbols.PATENT_SCENE_SCORE_CACHE + 1);
for (let address = 0xcd8; address <= 0xcdf; address++) allowed.add(address);
for (let address = 0xf60; address < 0xf7c; address++) allowed.add(address);

let scenes = 0;
let commits = 0;
function checkCommit(scene, reverse = false) {
  const memory = {};
  for (let address = 0xc20; address <= 0xd0b; address++) memory[address] = scene.mem[address];
  for (let index = 0; index < 16; index++) memory[0x880 + index] = reverse ? 15 - index : index;
  const prepared = execute(rom, symbols, 'PatentDisplayPrepare', [],
    { memory, biosStack: true, j: 16, sceneInterrupts: true, stepLimit: 10000 });
  for (const address of prepared.writes) assert((address >= 0x880 && address < 0x890) ||
    (address >= symbols.PATENT_DISPLAY_X && address < symbols.PATENT_DISPLAY_X + 16));
  const preparedMemory = { ...memory };
  for (let index = 0; index < 16; index++) preparedMemory[0x880 + index] = prepared.mem[0x880 + index];
  const result = execute(rom, symbols, 'PatentDisplayCommit', [...prepared.regs],
    { memory: preparedMemory, biosStack: true, j: 16, sceneInterrupts: true, stepLimit: 10000 });
  const order = Array.from({ length: 16 }, (_, slot) => slot)
    .sort((left, right) => decode(scene, left).x - decode(scene, right).x || left - right);
  for (let index = 0; index < 16; index++) {
    const slot = order[index], object = decode(scene, slot);
    for (const bank of [0x870, 0x880]) assert.equal(result.mem[bank + index], slot | (object.y >= 256 ? 128 : 0));
    for (const bank of [0x850, 0x860]) assert.equal(result.mem[bank + index], object.y & 255);
    assert.equal(result.mem[0x840 + slot], object.x);
  }
  for (const address of result.writes) assert(address >= 0x840 && address < 0x890);
  assert.equal(new Set(result.writes).size, 80);
  for (const [address, value] of Object.entries(memory)) {
    if (Number(address) < 0x880 || Number(address) >= 0x890) assert.equal(result.mem[address], value);
  }
  assert.equal(result.regs[9], 16);
  assert.equal(result.w & 16, 0);
  commits++;
}
checkCommit(initialized);
for (const x of [8, 28, 33, 34, 40, 43, 44, 91, 92, 94, 95, 96, 97, 144, 145, 148, 154, 155, 180]) {
  for (const server of [0, 1]) for (const mode of [0, 3, 4]) for (const image of [0, 1]) {
    const events = (x >= 92 && x <= 96 ? 8 : 0) | (image ? 0x30 : 0);
    const boyY = mode === 0 ? 255 : 140, boyX = server ? 134 : 54;
    const memory = { ...baseMemory, 0xce0: x, 0xce1: 148, 0xce9: events, 0xcea: mode,
      0xceb: server, 0xced: 0x09, 0xcee: 0x15, 0xcef: boyX, 0xcf0: boyY, 0xcf1: image,
      0xcda: 70, 0xcde: 218 };
    const result = execute(rom, symbols, 'PatentSceneUpdate', [],
      { memory, biosStack: true, maskedStack: true, j: 16, sceneInterrupts: true, stepLimit: 10000 });
    const choice = selection(x), rightBall = choice & 1, rightNet = choice & 2;
    const ball = decode(result, 0);
    assert.equal(ball.x, (x + (rightBall ? -6 : -2)) & 255);
    assert.equal(ball.y, 145 + (events & 8 ? 256 : 0));
    assert.equal(ball.pointer, symbols[rightBall ? 'PatentBR' : 'PatentBL']);
    assert.equal(ball.color, 0xe0);
    for (const [slot, logicalY, centerX] of [[1, 70, 34], [2, 218, 154]]) {
      const draw = decode(result, slot);
      assert.equal(draw.y, logicalY - 15);
      assert.equal(draw.width, image ? 2 : 1);
      assert.equal(draw.x, slot === 1 ? 30 : image ? 142 : 150);
      assert.deepEqual([...result.mem.slice(0xcd8 + (slot - 1) * 4, 0xcdc + (slot - 1) * 4)],
        [centerX, 4, logicalY, 16]);
    }
    for (const [slot, y] of [[9, 54], [10, 114], [11, 174]]) {
      const net = decode(result, slot);
      assert.equal(net.x, rightNet ? 87 : 93);
      assert.equal(net.y, y);
      assert.equal(net.pointer, symbols[rightNet ? 'PatentNR' : 'PatentNL']);
    }
    for (const field of [0, 1]) {
      const boy = decode(result, 5, field);
      assert.equal(boy.x, boyX - 8);
      assert.equal(boy.y, boyY === 255 ? 511 : boyY);
      assert.equal(boy.pointer, symbols[`Patent${server ? 'RB' : 'LB'}${image + 1}${field ? 'E' : 'O'}`]);
      for (const [slot, color, originX] of [[6, 0xc0, 47], [3, 0x20, 102]]) {
        const crowd = decode(result, slot, field);
        assert.equal(crowd.x, originX);
        assert.equal(crowd.y, 38);
        assert.equal(crowd.color, color);
        assert.equal(crowd.pointer, symbols[`PatentCR${rightNet ? 2 : 1}${field ? 'E' : 'O'}`]);
      }
      for (const slot of [12, 13]) assert.equal(decode(result, slot, field).y, mode === 4 ? 314 : 58);
    }
    for (const address of result.writes) assert(allowed.has(address), `unexpected write ${address.toString(16)}`);
    assert.equal(result.regs[9], 16);
    assert.equal(result.w & 16, 0);
    checkCommit(result, (scenes & 1) !== 0);
    scenes++;
  }
}
const cachedMemory = {};
for (let address = 0xc20; address <= 0xd0b; address++) cachedMemory[address] = initialized.mem[address];
for (let address = 0xf60; address < 0xf7c; address++) cachedMemory[address] = initialized.mem[address];
const cached = execute(rom, symbols, 'PatentSceneUpdate', [],
  { memory: cachedMemory, biosStack: true, j: 16, sceneInterrupts: true, stepLimit: 10000 });
assert(!cached.writes.some(address => address >= 0xf60 && address < 0xf7c), 'unchanged scores must remain cached');
const configured = execute(rom, symbols, 'PatentDisplayConfigure', [], { sceneInterrupts: true });
assert.deepEqual([...configured.mem.slice(0xffa, 0x1000)], [16, 1, 12, 32, 12, 80]);
assert.deepEqual(configured.writes, [0xffa, 0xffb, 0xffc, 0xffd, 0xffe, 0xfff,
  ...Array.from({ length: 16 }, (_, index) => 0x880 + index)]);
console.log(`Assets: ${assets.length} scene assets match the selected reconstruction.`);
console.log('Selection: all 256 X values reproduce the patent ball/net/crowd bands.');
console.log(`Scene: initialization and ${scenes} complete updates verify origins, fields, palettes,`);
console.log('visibility, stable paddle bodies and allowed writes; all BIOS stack calls mask interrupts.');
console.log(`Display: ${commits} commits preserve stable retail X ordering and both 9-bit Y/order lists.`);
console.log('Odd/even BIOS field sources use distinct shadow sets. ISR/capture timing remains untested.');
