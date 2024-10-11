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

