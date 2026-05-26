vim.pack.add({'https://github.com/saghen/blink.lib'})
vim.pack.add({'https://github.com/saghen/blink.cmp'})
vim.pack.add({'https://github.com/L3MON4D3/LuaSnip'})
vim.pack.add({'https://github.com/folke/lazydev.nvim'})
require('luasnip').setup({
  region_check_events = 'CursorHold,InsertLeave',
  delete_check_events = 'TextChanged,InsertEnter',
})

require('blink.cmp').setup({
  keymap = {
    preset = 'default',
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'lua' },
  signature = { enabled = true },
})

