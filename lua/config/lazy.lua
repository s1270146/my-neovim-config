-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- lsp
        {"neovim/nvim-lspconfig"},
        {"williamboman/mason.nvim"},
        {"williamboman/mason-lspconfig.nvim"},
        {
            'linux-cultist/venv-selector.nvim',
            dependencies = {
                'neovim/nvim-lspconfig',
                'mfussenegger/nvim-dap', 'mfussenegger/nvim-dap-python',
                {
                    "nvim-telescope/telescope.nvim",
                    branch = "0.1.x",
                    dependencies = {
                        "nvim-lua/plenary.nvim",
                    },
                },
            },
            branch = "regexp",
            lazy = false,
            keys = {
                -- Keymap to open VenvSelector to pick a venv.
                { '<leader>vs', '<cmd>VenvSelect<cr>' },
            },
        },
        {
            "nvimtools/none-ls.nvim",
            event = "VeryLazy",
            opts = function(_, opts)
                local nls = require("null-ls")
                opts.sources = opts.sources or {}
                table.insert(opts.sources, nls.builtins.formatting.prettierd)
            end,
        },
       

        -- completion
        {"L3MON4D3/LuaSnip"},
        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"saadparwaiz1/cmp_luasnip"},
        {"cohama/lexima.vim"},

        -- icon
        {"nvim-tree/nvim-web-devicons"},

        -- tree
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
                "MunifTanjim/nui.nvim",
                -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            },
        },

        -- looks
        {
            "nvim-lualine/lualine.nvim",
            requires = {
                "nvim-tree/nvim-web-devicons", opt = true
            },
        },
        {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup {
                    ensure_installed = { "python", "lua", "javascript"},
                    highlight = {
                        enable = true,
                    },
                    indent = {
                        enable = true,
                    },
                }
            end
        },

        -- ssh
        {
            "amitds1997/remote-nvim.nvim",
            version = "v0.3.11",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                "nvim-telescope/telescope.nvim",
            },
            config = true,
        },

        -- tab
        {
            'romgrk/barbar.nvim',
            dependencies = {
                'lewis6991/gitsigns.nvim',
                'nvim-tree/nvim-web-devicons',
            },
            init = function() vim.g.barbar_auto_setup = false end,
            opts = {

            },
            version = '^1.0.0',
        },
        {
            "vinnymeller/swagger-preview.nvim",
            run = "npm install -g swagger-ui-watcher",
        },
        {
            "lewis6991/gitsigns.nvim",
        },
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            dependencies = {
                "MunifTanjim/nui.nvim",
            }
        }    
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

