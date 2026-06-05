<script setup lang="ts">
import { ref } from 'vue'
import { useItemFilter } from './composables/useItemFilter'
import FilterGroup from './components/FilterGroup.vue'
import ItemCard from './components/ItemCard.vue'

const f = useItemFilter()
const sidebarOpen = ref(false)

const opt = (vals: (string | number)[]) => vals.map((v) => ({ label: String(v), value: v }))
const starOptions = f.STAR_LEVELS.map((s) => ({ label: `${s}★`, value: s }))
</script>

<template>
  <div class="layout">
    <aside class="sidebar" :class="{ open: sidebarOpen }">
      <div class="brand">
        <h1>Oaken Tower</h1>
        <p>Item ability filter</p>
      </div>

      <FilterGroup
        title="Rarity"
        :options="opt(f.facets.rarities)"
        :selected="f.rarities"
        @toggle="(v) => f.toggle(f.rarities, v)"
      />
      <FilterGroup
        title="Potion subcategory"
        hint="Applies to potions only."
        :options="opt(f.facets.potionClasses)"
        :selected="f.potionClasses"
        @toggle="(v) => f.toggle(f.potionClasses, v)"
      />
      <FilterGroup
        title="Star level"
        hint="Each star level has its own ability."
        :options="starOptions"
        :selected="f.stars"
        @toggle="(v) => f.toggle(f.stars, v as number)"
      />
      <FilterGroup
        title="Trigger"
        hint="Select to show only abilities with these triggers."
        :options="opt(f.facets.triggers)"
        :selected="f.triggers"
        @toggle="(v) => f.toggle(f.triggers, v)"
      />
      <FilterGroup
        title="Effect"
        hint="Select to show only abilities with these effects."
        :options="opt(f.facets.effects)"
        :selected="f.effects"
        @toggle="(v) => f.toggle(f.effects, v)"
      />

      <div class="req-note">
        Requirements — uncheck what you <em>don't</em> have to hide items whose ability depends on it.
      </div>
      <FilterGroup
        title="Requires item pack"
        :options="opt(f.facets.reqPacks)"
        :selected="f.allowedPacks"
        @toggle="(v) => f.toggle(f.allowedPacks, v)"
      />
      <FilterGroup
        title="Requires type"
        :options="opt(f.facets.reqSynergies)"
        :selected="f.allowedSynergies"
        @toggle="(v) => f.toggle(f.allowedSynergies, v)"
      />
      <FilterGroup
        title="Requires tag"
        :options="opt(f.facets.reqTags)"
        :selected="f.allowedTags"
        @toggle="(v) => f.toggle(f.allowedTags, v)"
      />
    </aside>

    <main class="content">
      <header class="topbar">
        <button class="menu" @click="sidebarOpen = !sidebarOpen">☰ Filters</button>
        <input
          v-model="f.search.value"
          class="search"
          type="search"
          placeholder="Search name or ability text…"
        />
        <span class="count">{{ f.rows.value.length }} / {{ f.totalRows }}</span>
        <button class="reset" @click="f.resetAll()">Reset</button>
      </header>

      <div v-if="f.rows.value.length === 0" class="empty">
        No items match the current filters.
      </div>
      <div class="grid">
        <ItemCard v-for="row in f.rows.value" :key="row.key" :row="row" />
      </div>
    </main>
  </div>
</template>

<style scoped>
.layout {
  display: grid;
  grid-template-columns: 320px 1fr;
  min-height: 100vh;
}
.sidebar {
  background: var(--panel);
  border-right: 1px solid var(--line);
  padding: 16px 18px 40px;
  overflow-y: auto;
  height: 100vh;
  position: sticky;
  top: 0;
}
.brand h1 {
  margin: 0;
  font-size: 20px;
}
.brand p {
  margin: 2px 0 8px;
  color: var(--muted);
  font-size: 12px;
}
.req-note {
  margin-top: 16px;
  padding: 10px;
  background: #3a1f28;
  border: 1px solid #5a2f3a;
  border-radius: 6px;
  font-size: 11px;
  color: #ffb3c2;
  line-height: 1.4;
}
.content {
  display: flex;
  flex-direction: column;
  min-width: 0;
}
.topbar {
  position: sticky;
  top: 0;
  z-index: 5;
  display: flex;
  gap: 10px;
  align-items: center;
  padding: 12px 18px;
  background: var(--bg);
  border-bottom: 1px solid var(--line);
}
.menu {
  display: none;
}
.search {
  flex: 1;
  background: var(--card);
  border: 1px solid var(--line);
  border-radius: 6px;
  padding: 9px 12px;
  color: var(--text);
  font-size: 14px;
}
.count {
  font-size: 13px;
  color: var(--muted);
  white-space: nowrap;
}
.reset {
  background: var(--card);
  border: 1px solid var(--line);
  color: var(--text);
  border-radius: 6px;
  padding: 8px 12px;
  cursor: pointer;
}
.reset:hover {
  border-color: var(--accent);
}
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 12px;
  padding: 16px 18px 60px;
}
.empty {
  padding: 60px 20px;
  text-align: center;
  color: var(--muted);
}
button {
  font: inherit;
}

@media (max-width: 860px) {
  .layout {
    grid-template-columns: 1fr;
  }
  .sidebar {
    position: fixed;
    z-index: 20;
    width: 300px;
    transform: translateX(-100%);
    transition: transform 0.2s ease;
  }
  .sidebar.open {
    transform: translateX(0);
  }
  .menu {
    display: inline-block;
    background: var(--card);
    border: 1px solid var(--line);
    color: var(--text);
    border-radius: 6px;
    padding: 8px 12px;
    cursor: pointer;
  }
}
</style>
