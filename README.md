# Oaken Tower Item Filter

A browser-based filter for items in the game [Oaken Tower](https://oakentower.wiki.gg). Filter abilities by trigger, effect, requirements, rarity, star level, and more.

## Setup

```bash
npm install
npm run data:fetch   # download latest item data from the wiki
npm run data         # parse + tag + build the bundled JSON
npm run dev          # start dev server
```

Open http://localhost:5173.

## Updating item data

Item data is a local snapshot of the wiki's `Module:ItemData` — no network calls happen at runtime. To pull fresh data:

```bash
npm run data:fetch   # download latest ItemData.lua from the wiki
npm run data         # parse → auto-tag → rebuild
```

`npm run data` preserves any manual edits made to `src/data/ability-tags.json`.

## Production build

```bash
npm run build
```

Outputs a static bundle to `dist/`. Deployable to any static host — no server required.
