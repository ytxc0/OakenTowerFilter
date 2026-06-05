// Download the raw Lua module from the wiki into data/raw/ItemData.lua.
import { writeFile, mkdir } from 'node:fs/promises'
import { fileURLToPath } from 'node:url'
import { dirname, join } from 'node:path'

const __dirname = dirname(fileURLToPath(import.meta.url))
const ROOT = join(__dirname, '..')
const URL = 'https://oakentower.wiki.gg/wiki/Module:ItemData?action=raw'

const res = await fetch(URL, { headers: { 'User-Agent': 'TreeTower-itemfilter/0.1' } })
if (!res.ok) {
  console.error(`Fetch failed: HTTP ${res.status}`)
  process.exit(1)
}
const lua = await res.text()
await mkdir(join(ROOT, 'data', 'raw'), { recursive: true })
await writeFile(join(ROOT, 'data', 'raw', 'ItemData.lua'), lua, 'utf8')
console.log(`Saved ${lua.length} bytes to data/raw/ItemData.lua`)
