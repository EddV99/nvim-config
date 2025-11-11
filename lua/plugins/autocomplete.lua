vim.pack.add({
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.7.0' }
})

local cmp = require('blink.cmp')
cmp.setup({
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})
