vim.pack.add({{
  src = 'https://github.com/rose-pine/neovim', 
  name = 'rose-pine' 
}})

vim.pack.add({{
  src = 'https://github.com/folke/tokyonight.nvim', 
  name = 'tokyo-night' 
}})

-- vim.cmd 'colorscheme rose-pine-moon'
vim.cmd 'colorscheme tokyonight-moon'

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#908caa' }) -- lines above cursor
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#908caa' }) -- lines below cursor
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#e0def4' }) -- current line number
