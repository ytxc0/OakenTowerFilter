export interface StarEntry {
  star: number | null
  ability: string
  stats: Record<string, number>
  triggers: string[]
  effects: string[]
  requires: { packs: string[]; tags: string[]; synergies: string[] }
}

export interface Item {
  id: string
  displayName: string
  secondName?: string | null
  image: string
  kind: 'item' | 'potion'
  rarity: string
  damageType?: string | null
  potionClass?: string | null
  potionType?: string | null
  packs: string[]
  types: string[]
  cost: number | null
  stars: StarEntry[]
}

export interface Facets {
  rarities: string[]
  potionClasses: string[]
  packs: string[]
  tags: string[]
  triggers: string[]
  effects: string[]
  reqPacks: string[]
  reqTags: string[]
  reqSynergies: string[]
}

export interface Dataset {
  items: Item[]
  facets: Facets
}

// A flattened (item, star) result row.
export interface Row {
  item: Item
  entry: StarEntry
  key: string
}
