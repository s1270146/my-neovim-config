local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('t', '<C-t>', '<C-\\><C-n><C-w>q', opts)
keymap('n', '<C-t>', ':T<CR>', opts)
