// Ensure every unique ability string has an entry in src/data/ability-tags.json.
// New entries are auto-tagged and flagged reviewed:false. Existing entries are
// preserved untouched, so this file is the hand-editable source of truth.
import { readFile, writeFile } from 'node:fs/promises'
import { fileURLToPath } from 'node:url'
import { dirname, join } from 'node:path'
import { abilityKey } from './lib/clean.mjs'
import { autoTag } from './lib/autotag.mjs'

const __dirname = dirname(fileURLToPath(import.meta.url))
const ROOT = join(__dirname, '..')
const TAGS_PATH = join(ROOT, 'src', 'data', 'ability-tags.json')

const items = JSON.parse(await readFile(join(ROOT, 'src', 'data', 'items.json'), 'utf8'))

let existing = {}
try {
  existing = JSON.parse(await readFile(TAGS_PATH, 'utf8'))
} catch {
  existing = {}
}

let added = 0
const seen = new Set()
for (const item of items) {
  for (const st of item.stars) {
    if (!st.ability) continue
    const key = abilityKey(st.ability)
    seen.add(key)
    if (existing[key]) continue
    const tags = autoTag(st.ability)
    existing[key] = {
      text: st.ability,
      triggers: tags.triggers,
      effects: tags.effects,
      requires: tags.requires,
      reviewed: false,
    }
    added++
  }
}

// Sort keys for stable diffs.
const sorted = {}
for (const k of Object.keys(existing).sort()) sorted[k] = existing[k]

await writeFile(TAGS_PATH, JSON.stringify(sorted, null, 2), 'utf8')
console.log(`ability-tags.json: ${added} new, ${seen.size} referenced, ${Object.keys(sorted).length} total`)
