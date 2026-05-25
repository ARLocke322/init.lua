-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('i', '<Esc>', '<cmd>echo "Use jk to escape!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { desc = 'Move focus to the upper window' })

-- Custom keymaps
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centered' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

vim.keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without yank' })
vim.keymap.set('n', '<leader>d', '"_d', { desc = 'Delete without yank' })
vim.keymap.set('v', '<leader>d', '"_d', { desc = 'Delete without yank' })

vim.keymap.set('i', 'jk', '<Esc>', { noremap = false })
vim.keymap.set('n', 'n', 'nzzzv', { noremap = false })

vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Close buffer' })
-- Use Alt/Option + Arrow keys instead
vim.keymap.set('n', '<M-Right>', '<cmd>vertical resize +2<cr>')
vim.keymap.set('n', '<M-Left>', '<cmd>vertical resize -2<cr>')
vim.keymap.set('n', '<M-Up>', '<cmd>resize +2<cr>')
vim.keymap.set('n', '<M-Down>', '<cmd>resize -2<cr>')

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

-- Stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

vim.keymap.set('n', '-', '<cmd>Oil<CR>')
