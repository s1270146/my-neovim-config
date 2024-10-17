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

custom_autocmd("FileType", {
    desc = "launch lua-language-server",
    pattern = "lua",
    callback = function()
        vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            root_dir = vim.fs.dirname(vim.fs.find({".git"}, {upward = true})[1]),
        })
    end
})
