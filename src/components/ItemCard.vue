<script setup lang="ts">
import { computed, ref } from 'vue'
import type { Row } from '../types'

const props = defineProps<{ row: Row }>()

// MediaWiki normalizes file titles: spaces -> underscores, first letter
// uppercased. Linking to the canonical /images/ path directly avoids the
// Special:FilePath redirect chain, which Cloudflare blocks cross-origin
// (ERR_BLOCKED_BY_RESPONSE.NotSameOrigin).
const imgUrl = computed(() => {
  const raw = props.row.item.image
  if (!raw) return ''
  const name = raw.replace(/ /g, '_').replace(/^./, (c) => c.toUpperCase())
  return `https://oakentower.wiki.gg/images/${encodeURIComponent(name)}`
})

const imgBroken = ref(false)

const starLabel = computed(() => {
  const s = props.row.entry.star
  return s === null ? null : s
})

const statList = computed(() => {
  const s = props.row.entry.stats
  const order = ['damage', 'crit', 'multicast', 'poison', 'burn', 'bleed', 'shock', 'block', 'healing', 'cost']
  const labels: Record<string, string> = {
    damage: 'DMG', crit: 'Crit%', multicast: 'Multi', poison: 'Poison', burn: 'Burn',
    bleed: 'Bleed', shock: 'Shock', block: 'Block', healing: 'Heal', cost: 'Cost',
  }
  return order.filter((k) => k in s).map((k) => ({ label: labels[k], value: s[k] }))
})

const req = computed(() => props.row.entry.requires)
const hasReq = computed(() => req.value.packs.length || req.value.tags.length || req.value.synergies.length)
</script>

<template>
  <article class="card" :class="`rarity-${row.item.rarity.toLowerCase()}`">
    <div class="top">
      <img
        v-if="imgUrl && !imgBroken"
        :src="imgUrl"
        :alt="row.item.displayName"
        loading="lazy"
        @error="imgBroken = true"
      />
      <div class="title">
        <h4>{{ row.item.displayName }}</h4>
        <div class="meta">
          <span class="rarity">{{ row.item.rarity }}</span>
          <span v-if="row.item.kind === 'potion' && row.item.potionClass" class="tag">{{ row.item.potionClass }}</span>
          <span v-for="t in row.item.types" :key="t" class="tag">{{ t }}</span>
          <span v-for="p in row.item.packs" :key="p" class="pack">{{ p }}</span>
        </div>
      </div>
      <div v-if="starLabel !== null" class="stars" :title="`${starLabel}-star`">
        <span v-for="n in 3" :key="n" :class="{ filled: n <= starLabel }">★</span>
      </div>
    </div>

    <p class="ability">{{ row.entry.ability }}</p>

    <div v-if="statList.length" class="stats">
      <span v-for="st in statList" :key="st.label"><b>{{ st.value }}</b> {{ st.label }}</span>
    </div>

    <div class="badges">
      <span v-for="t in row.entry.triggers" :key="'t' + t" class="b trigger">{{ t }}</span>
      <span v-for="e in row.entry.effects" :key="'e' + e" class="b effect">{{ e }}</span>
    </div>
    <div v-if="hasReq" class="reqs">
      <span class="reqlabel">needs</span>
      <span v-for="p in req.packs" :key="'rp' + p" class="b req">{{ p }}</span>
      <span v-for="t in req.tags" :key="'rt' + t" class="b req">{{ t }}</span>
      <span v-for="s in req.synergies" :key="'rs' + s" class="b req">{{ s }}</span>
    </div>
  </article>
</template>

<style scoped>
.card {
  background: var(--card);
  border: 1px solid var(--line);
  border-left: 3px solid var(--muted);
  border-radius: 8px;
  padding: 12px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.top {
  display: flex;
  gap: 10px;
  align-items: flex-start;
}
img {
  width: 44px;
  height: 44px;
  object-fit: contain;
  image-rendering: pixelated;
  flex-shrink: 0;
}
.title {
  flex: 1;
  min-width: 0;
}
h4 {
  margin: 0;
  font-size: 15px;
}
.meta {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
  margin-top: 4px;
}
.meta span {
  font-size: 10px;
  padding: 1px 6px;
  border-radius: 4px;
  background: var(--chip-bg);
  color: var(--muted);
}
.rarity {
  color: var(--text) !important;
  font-weight: 600;
}
.pack {
  color: var(--accent) !important;
}
.stars {
  color: #444;
  letter-spacing: 1px;
}
.stars .filled {
  color: #f4c430;
}
.ability {
  margin: 0;
  font-size: 13px;
  line-height: 1.4;
}
.stats {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  font-size: 11px;
  color: var(--muted);
}
.stats b {
  color: var(--text);
}
.badges,
.reqs {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
  align-items: center;
}
.b {
  font-size: 10px;
  padding: 2px 7px;
  border-radius: 999px;
}
.trigger {
  background: #1f3a5f;
  color: #8fc1ff;
}
.effect {
  background: #1f4030;
  color: #8fe0b0;
}
.req {
  background: #4a2330;
  color: #ff9db0;
}
.reqlabel {
  font-size: 10px;
  color: var(--muted);
  text-transform: uppercase;
}
.rarity-common { border-left-color: #b8b8b8; }
.rarity-rare { border-left-color: #4a90d9; }
.rarity-epic { border-left-color: #9b59b6; }
.rarity-legendary { border-left-color: #e67e22; }
.rarity-forged { border-left-color: #e74c3c; }
.rarity-special { border-left-color: #1abc9c; }
.rarity-cursed { border-left-color: #8e44ad; }
.rarity-potions { border-left-color: #f4c430; }
</style>
