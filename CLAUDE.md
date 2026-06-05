# TreeTower — Oaken Tower Item Filter

Frontend-only Vue 3 + Vite + TypeScript app for filtering items from the game *Oaken Tower* by ability triggers, effects, and requirements.

## Running

```
npm run dev          # dev server → http://localhost:5173
npm run build        # vue-tsc type-check + vite build → dist/
npm run data         # parse Lua → scaffold tags → build enriched JSON (no network)
npm run data:fetch   # fetch fresh ItemData.lua from wiki
```

Dev server preview config: `.claude/launch.json`, server name `"dev"`, port 5173.

## Architecture

**Data pipeline** (`scripts/`) — offline Node scripts run by a developer:

| Script | Input | Output |
|---|---|---|
| `fetch-itemdata.mjs` | wiki API | `data/raw/ItemData.lua` |
| `parse-itemdata.mjs` | ItemData.lua | `src/data/items.json` |
| `scaffold-tags.mjs` | items.json | `src/data/ability-tags.json` (preserves existing entries) |
| `build-enriched.mjs` | items.json + ability-tags.json | `src/data/items.enriched.json` |

**Vue app** — imports `src/data/items.enriched.json` at build time, all filtering is client-side.

## Taxonomy (`scripts/lib/taxonomy.mjs`)

- `TAGS` — item categories from the wiki `Tags` field (Sword, Bow, Mace, Spell, Artifact…). **Note: was previously named `TYPES` — renamed to match the wiki field name.**
- `SYNERGY_TAGS` — concepts an ability scales with (Poison, Burn, Crit, Gold…)
- `PACKS` — faction packs (Arcane, Crystal, Dark…)
- `TRIGGERS`, `EFFECTS` — controlled vocabularies

## Data Model

### `src/data/ability-tags.json` (hand-editable source of truth)

Keyed by normalized ability text. Each entry:
```json
{
  "text": "...",
  "triggers": ["On Trigger"],
  "effects": ["Increase Damage"],
  "requires": {
    "packs": ["Arcane"],
    "tags": ["Sword"],        // item categories (wiki Tags field)
    "synergies": ["Debuff"]   // synergy concepts
  },
  "reviewed": false
}
```

### `src/types.ts`

```ts
StarEntry.requires: { packs: string[]; tags: string[]; synergies: string[] }
Facets: { rarities, potionClasses, packs, tags, triggers, effects, reqPacks, reqTags, reqSynergies }
```

**207 items, 583 star-rows, 579 unique ability keys** in the current dataset.

## Filter Logic (`src/composables/useItemFilter.ts`)

| Set | Semantics | Default |
|---|---|---|
| `rarities`, `potionClasses`, `stars` | include (all selected = show all) | all selected |
| `triggers`, `effects` | include (empty = no constraint) | empty |
| `allowedPacks`, `allowedTags`, `allowedSynergies` | deselect-to-exclude | all selected |

## Sidebar Groups (`src/App.vue`)

1. Rarity
2. Potion subcategory
3. Star level
4. Trigger
5. Effect
6. Requires item pack → `reqPacks` / `allowedPacks`
7. Requires type → `reqSynergies` / `allowedSynergies`
8. Requires tag → `reqTags` / `allowedTags` ← Sword, Bow, Mace, etc.

## Known Issues / Decisions

- **Images:** `ItemCard.vue` builds URLs as `https://oakentower.wiki.gg/images/<name>` (spaces→underscores, first letter uppercased). Do **not** use `Special:FilePath/` — that redirect chain is blocked cross-origin by Cloudflare (`ERR_BLOCKED_BY_RESPONSE.NotSameOrigin`).
- **Missing image:** `Small Luck Potion.png` is referenced in the Lua module but not uploaded to the wiki — handled gracefully with `@error` hiding the `<img>`.
- **`tsconfig.node.json`** requires `"composite": true, "noEmit": false, "emitDeclarationOnly": true` for `vue-tsc -b` to work.
