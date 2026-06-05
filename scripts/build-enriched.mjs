// Merge items.json + ability-tags.json -> src/data/items.enriched.json.
// Attaches tags to each (item, star) and emits the facet lists the UI needs.
import { readFile, writeFile } from 'node:fs/promises'
import { fileURLToPath } from 'node:url'
import { dirname, join } from 'node:path'
import { abilityKey } from './lib/clean.mjs'
import { PACKS, TAGS, SYNERGY_TAGS, TRIGGERS, EFFECTS } from './lib/taxonomy.mjs'

const __dirname = dirname(fileURLToPath(import.meta.url))
const ROOT = join(__dirname, '..')

const items = JSON.parse(await readFile(join(ROOT, 'src', 'data', 'items.json'), 'utf8'))
const tags = JSON.parse(await readFile(join(ROOT, 'src', 'data', 'ability-tags.json'), 'utf8'))

const usedTriggers = new Set()
const usedEffects = new Set()
const usedReqPacks = new Set()
const usedReqTags = new Set()
const usedReqSynergies = new Set()
const rarities = new Set()
const potionClasses = new Set()
const itemPacks = new Set()
const itemTags = new Set()

const enriched = items.map((item) => {
  rarities.add(item.rarity)
  if (item.potionClass) potionClasses.add(item.potionClass)
  for (const p of item.packs) itemPacks.add(p)
  for (const t of item.types) itemTags.add(t)

  const stars = item.stars.map((st) => {
    const entry = tags[abilityKey(st.ability)]
    const t = entry?.triggers ?? []
    const e = entry?.effects ?? []
    const req = entry?.requires ?? { packs: [], tags: [], synergies: [] }
    t.forEach((x) => usedTriggers.add(x))
    e.forEach((x) => usedEffects.add(x))
    req.packs.forEach((x) => usedReqPacks.add(x))
    req.tags.forEach((x) => usedReqTags.add(x))
    req.synergies?.forEach((x) => usedReqSynergies.add(x))
    return { ...st, triggers: t, effects: e, requires: req }
  })
  return { ...item, stars }
})

const orderBy = (order) => (a, b) => {
  const ia = order.indexOf(a)
  const ib = order.indexOf(b)
  if (ia === -1 && ib === -1) return a.localeCompare(b)
  if (ia === -1) return 1
  if (ib === -1) return -1
  return ia - ib
}

const RARITY_ORDER = ['Common', 'Rare', 'Epic', 'Legendary', 'Forged', 'Special', 'Cursed', 'Potions']
const POTION_ORDER = ['Lesser Potion', 'Vial', 'Potion', 'Major Potion', 'Special Potion', 'Essence']

const out = {
  items: enriched,
  facets: {
    rarities: [...rarities].sort(orderBy(RARITY_ORDER)),
    potionClasses: [...potionClasses].sort(orderBy(POTION_ORDER)),
    packs: [...itemPacks].sort(orderBy(PACKS)),
    tags: [...itemTags].sort(orderBy(TAGS)),
    triggers: [...usedTriggers].sort(orderBy(TRIGGERS)),
    effects: [...usedEffects].sort(orderBy(EFFECTS)),
    reqPacks: [...usedReqPacks].sort(orderBy(PACKS)),
    reqTags: [...usedReqTags].sort(orderBy(TAGS)),
    reqSynergies: [...usedReqSynergies].sort(orderBy(SYNERGY_TAGS)),
  },
}

await writeFile(join(ROOT, 'src', 'data', 'items.enriched.json'), JSON.stringify(out, null, 2), 'utf8')
const rows = enriched.reduce((n, i) => n + i.stars.length, 0)
console.log(`Enriched ${enriched.length} items (${rows} star-rows) -> src/data/items.enriched.json`)
