// Heuristic tagger: turn a cleaned ability string into structured tags.
// Output is a best-effort baseline; ability-tags.json is hand-editable on top of it.
import { PACKS, TAGS, SYNERGY_TAGS } from './taxonomy.mjs'

const TAG_PATTERNS = [
  ['Sword', /\bswords?\b/],
  ['Dagger', /\bdaggers?\b/],
  ['Axe', /\baxe(?:s)?\b/],
  ['Mace', /\bmaces?\b/],
  ['Spear', /\bspears?\b/],
  ['Bow', /\bbows?\b/],
  ['Spell', /\bspells?\b/],
  ['Magic', /\bmagic\b/],
  ['Orb', /\borbs?\b/],
  ['Shield', /\bshields?\b/],
  ['Amulet', /\bamulets?\b/],
  ['Ring', /\brings?\b/],
  ['Artifact', /\bartifacts?\b/],
  ['Relic', /\brelics?\b/],
  ['Potion', /\bpotions?\b|\bvials?\b/],
]

function detectTriggers(t) {
  const out = new Set()
  if (/\bstart of combat\b/.test(t)) out.add('Start of Combat')
  if (/\bstart of day\b/.test(t)) out.add('Start of Day')
  if (/\bon first\b.*\btrigger/.test(t)) out.add('On First Trigger')
  if (/\bevery \d+\b.*\btrigger/.test(t) || /\bevery \w+ triggers?\b/.test(t)) out.add('Every N Triggers')
  if (/\bwhen obtained\b/.test(t)) out.add('On Obtain')
  if (/\bwhen sold\b|\bwhen this is sold\b/.test(t)) out.add('On Sold')
  if (/\bwhen you level up\b|\bwhen you reach level\b/.test(t)) out.add('On Level Up')
  if (/\b(when|whenever) (this|you|an item)\b.*\bcrit/.test(t) || /\bwhen .*crits\b/.test(t)) out.add('On Crit')
  if (/\bwhen you apply\b|\bwhen another item applies\b/.test(t)) out.add('On Apply Debuff')
  if (/\b(when another item heals|whenever you heal|when you heal)\b/.test(t)) out.add('On Heal')
  if (/\bwhenever you gain shield\b/.test(t)) out.add('On Gain Shield')
  if (/\bwhen you gain gold\b/.test(t)) out.add('On Gain Gold')
  if (/\bwhen the enemy reaches\b/.test(t)) out.add('On Enemy Low HP')
  if (/\b(when|whenever) (another|a) [\w ]*item triggers\b/.test(t) || /\bwhen another \w+ triggers\b/.test(t) || /\bon every trigger of item\b/.test(t)) out.add('When Another Item Triggers')
  if (/\bwhen (shock|poison|burn|bleed)[\w \-]*triggers on enemy\b/.test(t) || /\bwhen poison triggers\b/.test(t)) out.add('When Debuff Triggers')
  if (/\buse a? ?potion on\b|\bwhen using a potion\b|\bwhenever you use a potion\b|\bpotions consume\b|\bpotions grant\b/.test(t)) out.add('On Use Potion')
  // "On Trigger" last so more specific triggers are preferred, but still allow co-occurrence.
  if (/\bon trigger\b/.test(t)) out.add('On Trigger')
  if (out.size === 0) out.add('Passive')
  return [...out]
}

function detectEffects(t) {
  const out = new Set()
  if (/\bdeal \d+[\w ]*damage\b/.test(t)) out.add('Deal Damage')
  if (/(\bgain\b|\+\d+|bonus|permanently)[\w %+]*\bdamage\b|\bdmg\b/.test(t)) out.add('Increase Damage')
  if (/\bmulticast\b/.test(t)) out.add('Increase Multicast')
  if (/\bcrit(?:ical)?\b/.test(t)) out.add('Increase Crit')
  if (/\bpoison\b/.test(t)) out.add('Apply Poison')
  if (/\bburn\b/.test(t)) out.add('Apply Burn')
  if (/\bbleed\b/.test(t)) out.add('Apply Bleed')
  if (/\bshock\b/.test(t)) out.add('Apply Shock')
  if (/\b(shield|block)\b/.test(t)) out.add('Gain Block')
  if (/\bheal\b/.test(t)) out.add('Heal')
  if (/\bmax (hp|health)\b/.test(t)) out.add('Max HP')
  if (/\bcooldown\b|\bcd\b|\-\d+(?:\.\d+)?s\b/.test(t)) out.add('Cooldown Reduction')
  if (/\btrigger (this|it|your|item|all|adjacent|another|\d|a )\b|\btrigger them\b/.test(t)) out.add('Trigger Item')
  if (/\bcleanse\b|\bimmunity to debuffs\b/.test(t)) out.add('Cleanse')
  if (/\bgain \d* ?(random )?(lesser potion|vial|potion|goblet)/.test(t) || /\bgenerate\b.*\bpotion\b/.test(t)) out.add('Generate Potion')
  if (/\bgive (your|all your|adjacent|item|elven|crystal|dark|moon|flame|frosty|storm|holy|arcane|witch|spear|sword|axe|mace|bow)/.test(t) || /\bpermanently give\b/.test(t)) out.add('Buff Other Items')
  if (/\bgold\b|\bincome\b/.test(t)) out.add('Gain Gold')
  if (/\bcharge(s)?\b/.test(t)) out.add('Gain Charges')
  if (/\btransform\b|\bmorph\b/.test(t)) out.add('Transform Item')
  if (/\bplain (copy|copies)\b|\bcopy of\b|\bcopies of\b|\bbase copy\b/.test(t)) out.add('Copy Item')
  if (/\bxp\b|\bgain a level\b/.test(t)) out.add('Gain XP')
  if (/\bexecute\b/.test(t)) out.add('Execute')
  return [...out]
}

function detectRequires(t) {
  const packs = new Set()
  for (const p of PACKS) {
    if (p === 'Neutral' || p === 'All Packs') continue
    const re = new RegExp(`\\b${p.toLowerCase()}\\b`)
    if (re.test(t)) packs.add(p)
  }
  const itemTags = new Set()
  for (const [name, re] of TAG_PATTERNS) {
    if (name === 'Potion') continue // potion synergy handled as a synergy
    if (re.test(t)) itemTags.add(name)
  }
  const synergies = new Set()
  // Synergy keywords: ability scales with / depends on these concepts.
  if (/\byour poison items\b|\bper poison item\b|\bpoison items\b/.test(t)) synergies.add('Poison')
  if (/\byour burn items\b|\bper burn item\b|\bburn items\b/.test(t)) synergies.add('Burn')
  if (/\bbleed items\b|\bper bleed item\b/.test(t)) synergies.add('Bleed')
  if (/\bshock items\b|\bper shock item\b/.test(t)) synergies.add('Shock')
  if (/\brandom debuff\b|\bunique debuff\b|\bapply a debuff\b|\bof a debuff\b|\bdebuffs?\b/.test(t)) synergies.add('Debuff')
  if (/\bcrit/.test(t)) synergies.add('Crit')
  if (/\b(another item heals|whenever you heal|when you heal)\b/.test(t)) synergies.add('Heal')
  if (/\bgain shield\b|\bwhenever you gain shield\b/.test(t)) synergies.add('Shield')
  if (/\bthis item's multicast\b|\bper [\w ]*multicast\b|\bequal to .*multicast\b/.test(t)) synergies.add('Multicast')
  if (/\bpotion\b|\bvial\b/.test(t)) synergies.add('Potion')
  if (/\bgain gold\b|\bwhen you gain gold\b/.test(t)) synergies.add('Gold')
  return {
    packs: [...packs],
    tags: [...itemTags],
    synergies: [...synergies].filter((x) => SYNERGY_TAGS.includes(x)),
  }
}

export function autoTag(cleanText) {
  const t = ` ${cleanText.toLowerCase()} `
  return {
    triggers: detectTriggers(t),
    effects: detectEffects(t),
    requires: detectRequires(t),
  }
}
