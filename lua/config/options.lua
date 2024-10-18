vim.opt.guifont = "JetBrainsMono Nerd Font:h12"

local function set_opt(key, value)
    vim.opt[key] = value
end

set_opt('number', true)

set_opt('expandtab', true)
set_opt('shiftwidth', 4)
set_opt('tabstop', 4)

set_opt('ignorecase', true)
set_opt('smartcase', true)

