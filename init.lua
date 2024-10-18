-- plugin manager 
require('config.lazy')

-- plugin
require('plugins.nvim-web-devicons')
require('plugins.mason')
require('plugins.mason-lspconfig')
require('plugins.nvim-cmp')
require('plugins.lualine')

-- standard configuration
require('config.options')
require('config.keymaps')
require('config.commands')
