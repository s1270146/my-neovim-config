local function set_opt(key, value)
    vim.opt[key] = value
end

set_opt('number', true)

set_opt('expandtab', true)
set_opt('shiftwidth', 4)
set_opt('tabstop', 4)

set_opt('ignorecase', true)
set_opt('smartcase', true)

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('t', '<C-n>', [[<C-\><C-n>]], opts)

-- Custom command

local custom_cmd = vim.api.nvim_create_user_command
local custom_autocmd = vim.api.nvim_create_autocmd

-- Terminal
custom_cmd('T', function(opts)
    vim.api.nvim_command [[
        split
        wincmd j
        resize 20
        terminal
    ]]
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.api.nvim_feedkeys('i', 'n', false)
end, {
    nargs = 0,
})
