vim.pack.add({ {
	src = "https://github.com/rose-pine/neovim",
	name = "rose-pine",
} })

vim.pack.add({ {
	src = "https://github.com/folke/tokyonight.nvim",
	name = "tokyo-night",
} })

vim.pack.add({ {
	src = "https://github.com/sainnhe/gruvbox-material",
	name = "gruvbox-material",
} })

local colorscheme_file = vim.fn.stdpath("data") .. "/colorscheme.txt"

local saved = vim.fn.filereadable(colorscheme_file) == 1
		and vim.fn.trim(table.concat(vim.fn.readfile(colorscheme_file), "\n"))
	or "tokyonight-moon"
if saved ~= "" then
	pcall(vim.cmd.colorscheme, saved)
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("persist-colorscheme", { clear = true }),
	callback = function()
		vim.fn.writefile({ vim.g.colors_name }, colorscheme_file)
	end,
})

vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#908caa" }) -- lines above cursor
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#908caa" }) -- lines below cursor
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#e0def4' }) -- current line number
