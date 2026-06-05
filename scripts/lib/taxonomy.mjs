// Controlled vocabularies for ability tagging, derived from Module:ItemData.
// Shared by the data pipeline (auto-tagger) and re-exported to the app as JSON facets.

// Faction packs (the "Pack"/"Pack2" field values).
export const PACKS = [
  'Arcane', 'Crystal', 'Dark', 'Dragon', 'Elven', 'Flame',
  'Frosty', 'Holy', 'Moon', 'Neutral', 'Storm', 'Witch', 'All Packs',
]

// Item categories (the "Tags" field values in Module:ItemData).
export const TAGS = [
  'Sword', 'Dagger', 'Axe', 'Mace', 'Spear', 'Bow', 'Spell', 'Magic',
  'Orb', 'Shield', 'Amulet', 'Ring', 'Artifact', 'Relic', 'Potion',
]

// Cross-cutting synergy "tags" an ability can depend on.
export const SYNERGY_TAGS = [
  'Poison', 'Burn', 'Bleed', 'Shock', 'Debuff', 'Crit',
  'Heal', 'Shield', 'Multicast', 'Potion', 'Gold',
]

// How an ability is triggered.
export const TRIGGERS = [
  'On Trigger',
  'On First Trigger',
  'Start of Combat',
  'Start of Day',
  'Every N Triggers',
  'On Crit',
  'On Kill',
  'On Obtain',
  'On Sold',
  'On Level Up',
  'On Apply Debuff',
  'On Heal',
  'On Gain Shield',
  'On Gain Gold',
  'On Enemy Low HP',
  'When Another Item Triggers',
  'When Debuff Triggers',
  'On Use Potion',
  'Passive',
]

// What the ability does.
export const EFFECTS = [
  'Increase Damage',
  'Increase Multicast',
  'Increase Crit',
  'Apply Poison',
  'Apply Burn',
  'Apply Bleed',
  'Apply Shock',
  'Gain Block',
  'Heal',
  'Max HP',
  'Cooldown Reduction',
  'Trigger Item',
  'Cleanse',
  'Generate Potion',
  'Buff Other Items',
  'Gain Gold',
  'Gain Charges',
  'Transform Item',
  'Gain XP',
  'Execute',
  'Copy Item',
  'Deal Damage',
]
