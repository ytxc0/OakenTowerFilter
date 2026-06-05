// Strip MediaWiki markup from ability text and normalize whitespace.
export function cleanWikitext(raw) {
  if (typeof raw !== 'string') return ''
  let s = raw
  // Drop file/image embeds entirely: [[File:...]] / [[file:...]]
  s = s.replace(/\[\[\s*[Ff]ile:[^\]]*\]\]/g, '')
  // Piped links, incl. [[:Category:X|Y]] and [[X|Y]] -> keep display text Y
  s = s.replace(/\[\[[^\]|]*\|([^\]]+)\]\]/g, '$1')
  // Plain links [[:Category:X]] -> X ; [[X]] -> X
  s = s.replace(/\[\[\s*:?(?:Category:)?([^\]]+)\]\]/g, '$1')
  // Leftover stray brackets
  s = s.replace(/\[\[|\]\]/g, '')
  // Collapse whitespace
  s = s.replace(/\s+/g, ' ').trim()
  return s
}

// Stable key for an ability string so identical phrasings share one tag entry.
export function abilityKey(cleanText) {
  return cleanText.toLowerCase().replace(/\s+/g, ' ').trim()
}
