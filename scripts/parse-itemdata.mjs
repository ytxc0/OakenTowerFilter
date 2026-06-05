// Parse data/raw/ItemData.lua into src/data/items.json.
// Includes regular Items (Rarity + Ability0-3) and Potions (Class + Ability).
// Skips Encounters / Perks / Slots which are a different domain.
import { readFile, writeFile, mkdir } from 'node:fs/promises'
import { fileURLToPath } from 'node:url'
import { dirname, join } from 'node:path'
import luaparse from 'luaparse'
import { cleanWikitext } from './lib/clean.mjs'

const __dirname = dirname(fileURLToPath(import.meta.url))
const ROOT = join(__dirname, '..')

const lua = await readFile(join(ROOT, 'data', 'raw', 'ItemData.lua'), 'utf8')
const ast = luaparse.parse(lua, { comments: false, scope: false })

function findItemsTable(chunk) {
  for (const stmt of chunk.body) {
    if (stmt.type === 'LocalStatement' && stmt.variables.some((v) => v.name === 'items')) {
      const idx = stmt.variables.findIndex((v) => v.name === 'items')
      return stmt.init[idx]
    }
  }
  throw new Error('Could not locate `local items = {...}` table in module.')
}

function strValue(node) {
  if (!node) return undefined
  if (node.type === 'StringLiteral') {
    if (typeof node.value === 'string') return node.value
    // Fallback: strip surrounding quotes from raw.
    const raw = node.raw ?? ''
    return raw.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\').replace(/\\n/g, '\n')
  }
  if (node.type === 'NumericLiteral') return String(node.value)
  return undefined
}

function tableToObject(tableNode) {
  const obj = {}
  for (const field of tableNode.fields) {
    if (field.type === 'TableKeyString') {
      obj[field.key.name] = strValue(field.value)
    }
  }
  return obj
}

const itemsTable = findItemsTable(ast)

// Last-write-wins to mirror Lua semantics (handles the duplicate `poison_dagger` key).
const rawById = {}
for (const field of itemsTable.fields) {
  if (field.type !== 'TableKeyString') continue
  if (field.value.type !== 'TableConstructorExpression') continue
  rawById[field.key.name] = tableToObject(field.value)
}

const STAR_MULT = [1, 2, 4, 8]
const COST_MULT = [1, 3, 6, 12]

function num(v) {
  const n = Number(v)
  return Number.isFinite(n) ? n : null
}

function scaledStats(raw, star) {
  const m = STAR_MULT[star]
  const out = {}
  for (const key of ['Damage', 'Crit', 'Multicast', 'Poison', 'Burn', 'Bleed', 'Shock', 'Block', 'Healing']) {
    const base = num(raw[key])
    if (base !== null && base !== 0) out[key.toLowerCase()] = base * m
  }
  const cost = num(raw.Cost)
  if (cost !== null) out.cost = cost * COST_MULT[star]
  return out
}

const items = []

for (const [id, raw] of Object.entries(rawById)) {
  const isItem = !!raw.Rarity && raw.Rarity !== 'Unobtainable'
  const isPotion = !!raw.Class
  // Skip encounters/perks/slots and unobtainable.
  if (!isItem && !isPotion) continue

  const packs = [raw.Pack, raw.Pack2].filter(Boolean)
  if (packs.length === 0) packs.push('Neutral')
  const types = raw.Tags ? [raw.Tags] : []

  if (isPotion) {
    const ability = cleanWikitext(raw.Ability ?? '')
    items.push({
      id,
      displayName: raw.DisplayName ?? id,
      image: raw.Image ?? '',
      kind: 'potion',
      rarity: 'Potions',
      potionClass: raw.Class ?? null,
      potionType: raw.Type ?? null,
      packs,
      types,
      cost: num(raw.Cost),
      stars: [{ star: null, ability, stats: {} }],
    })
    continue
  }

  const stars = []
  for (let s = 0; s <= 3; s++) {
    const a = raw[`Ability${s}`]
    if (a === undefined || a === null || a === '') continue
    const ability = cleanWikitext(a)
    if (!ability) continue
    stars.push({ star: s, ability, stats: scaledStats(raw, s) })
  }
  if (stars.length === 0) continue

  items.push({
    id,
    displayName: raw.DisplayName ?? id,
    secondName: raw.SecondName ?? null,
    image: raw.Image ?? '',
    kind: 'item',
    rarity: raw.Rarity,
    damageType: raw.DamageType ?? null,
    packs,
    types,
    cost: num(raw.Cost),
    stars,
  })
}

items.sort((a, b) => a.displayName.localeCompare(b.displayName))

await mkdir(join(ROOT, 'src', 'data'), { recursive: true })
await writeFile(join(ROOT, 'src', 'data', 'items.json'), JSON.stringify(items, null, 2), 'utf8')
console.log(`Parsed ${items.length} items/potions -> src/data/items.json`)
