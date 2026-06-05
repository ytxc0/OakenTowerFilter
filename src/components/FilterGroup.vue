<script setup lang="ts">
interface Option {
  label: string
  value: string | number
}
const props = defineProps<{
  title: string
  hint?: string
  options: Option[]
  selected: Set<string | number>
}>()
const emit = defineEmits<{ (e: 'toggle', value: string | number): void }>()

function allSelected() {
  return props.options.every((o) => props.selected.has(o.value))
}
function setAll(on: boolean) {
  for (const o of props.options) {
    const has = props.selected.has(o.value)
    if (on && !has) emit('toggle', o.value)
    if (!on && has) emit('toggle', o.value)
  }
}
</script>

<template>
  <section class="group">
    <div class="group-head">
      <h3>{{ title }}</h3>
      <div class="bulk">
        <button type="button" @click="setAll(true)">all</button>
        <button type="button" @click="setAll(false)">none</button>
      </div>
    </div>
    <p v-if="hint" class="hint">{{ hint }}</p>
    <div class="chips">
      <label
        v-for="opt in options"
        :key="String(opt.value)"
        class="chip"
        :class="{ on: selected.has(opt.value) }"
      >
        <input
          type="checkbox"
          :checked="selected.has(opt.value)"
          @change="emit('toggle', opt.value)"
        />
        <span>{{ opt.label }}</span>
      </label>
    </div>
    <p v-if="!allSelected()" class="dim">filtering active</p>
  </section>
</template>

<style scoped>
.group {
  border-top: 1px solid var(--line);
  padding: 14px 0;
}
.group-head {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
h3 {
  margin: 0;
  font-size: 13px;
  text-transform: uppercase;
  letter-spacing: 0.05em;
  color: var(--accent);
}
.bulk button {
  background: none;
  border: none;
  color: var(--muted);
  cursor: pointer;
  font-size: 11px;
  padding: 0 4px;
}
.bulk button:hover {
  color: var(--text);
}
.hint {
  margin: 4px 0 8px;
  font-size: 11px;
  color: var(--muted);
}
.chips {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  margin-top: 8px;
}
.chip {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  padding: 4px 9px;
  border: 1px solid var(--line);
  border-radius: 999px;
  font-size: 12px;
  cursor: pointer;
  background: var(--chip-bg);
  user-select: none;
}
.chip input {
  display: none;
}
.chip.on {
  background: var(--accent-dim);
  border-color: var(--accent);
  color: var(--text);
}
.chip:not(.on) {
  color: var(--muted);
}
.dim {
  margin: 8px 0 0;
  font-size: 10px;
  color: var(--accent);
}
</style>
