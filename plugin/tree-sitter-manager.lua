vim.pack.add({'https://github.com/romus204/tree-sitter-manager.nvim'})

require('tree-sitter-manager').setup {
  ensure_installed = { 'ruby' }, -- list of parsers to install at the start of a neovim session
  auto_install = true, -- if enabled, install missing parsers when editing a new file
}
