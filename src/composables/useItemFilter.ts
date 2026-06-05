import { computed, reactive, ref } from 'vue'
import type { Dataset, Item, Row } from '../types'
import dataset from '../data/items.enriched.json'

const data = dataset as unknown as Dataset

const STAR_LEVELS = [0, 1, 2, 3]

function buildRows(items: Item[]): Row[] {
  const rows: Row[] = []
  for (const item of items) {
    for (const entry of item.stars) {
      rows.push({ item, entry, key: `${item.id}:${entry.star ?? 'x'}` })
    }
  }
  return rows
}

export function useItemFilter() {
  const facets = data.facets
  const allRows = buildRows(data.items)

  const search = ref('')

  // Include filters (a value present = allowed to show).
  const rarities = reactive(new Set(facets.rarities))
  const potionClasses = reactive(new Set(facets.potionClasses))
  const stars = reactive(new Set<number>(STAR_LEVELS))

  // Positive include filters (empty = no constraint).
  const triggers = reactive(new Set<string>())
  const effects = reactive(new Set<string>())

  // Deselect-to-exclude: everything allowed by default. Unchecking hides rows
  // whose ability requires that pack/type/tag (i.e. "I don't have this").
  const allowedPacks = reactive(new Set(facets.reqPacks))
  const allowedTags = reactive(new Set(facets.reqTags))
  const allowedSynergies = reactive(new Set(facets.reqSynergies))

  function toggle<T>(set: Set<T>, value: T) {
    if (set.has(value)) set.delete(value)
    else set.add(value)
  }

  const rows = computed<Row[]>(() => {
    const q = search.value.trim().toLowerCase()
    return allRows.filter(({ item, entry }) => {
      if (!rarities.has(item.rarity)) return false
      if (item.kind === 'potion' && item.potionClass && !potionClasses.has(item.potionClass)) return false
      if (entry.star !== null && !stars.has(entry.star)) return false

      if (q) {
        const hay = `${item.displayName} ${item.secondName ?? ''} ${entry.ability}`.toLowerCase()
        if (!hay.includes(q)) return false
      }

      if (triggers.size > 0 && !entry.triggers.some((t) => triggers.has(t))) return false
      if (effects.size > 0 && !entry.effects.some((e) => effects.has(e))) return false

      if (!entry.requires.packs.every((p) => allowedPacks.has(p))) return false
      if (!entry.requires.tags.every((t) => allowedTags.has(t))) return false
      if (!entry.requires.synergies.every((s) => allowedSynergies.has(s))) return false

      return true
    })
  })

  function resetAll() {
    search.value = ''
    facets.rarities.forEach((r) => rarities.add(r))
    facets.potionClasses.forEach((c) => potionClasses.add(c))
    STAR_LEVELS.forEach((s) => stars.add(s))
    triggers.clear()
    effects.clear()
    facets.reqPacks.forEach((p) => allowedPacks.add(p))
    facets.reqTags.forEach((t) => allowedTags.add(t))
    facets.reqSynergies.forEach((s) => allowedSynergies.add(s))
  }

  return {
    facets,
    search,
    rarities,
    potionClasses,
    stars,
    triggers,
    effects,
    allowedPacks,
    allowedTags,
    allowedSynergies,
    toggle,
    rows,
    totalRows: allRows.length,
    resetAll,
    STAR_LEVELS,
  }
}
