local function set_opt(key, value)
    vim.opt[key] = value
end

set_opt('number', true)
set_opt('relativenumber', true)

set_opt('expandtab', true)
set_opt('shiftwidth', 2)
set_opt('tabstop', 2)

set_opt('ignorecase', true)
set_opt('smartcase', true)

