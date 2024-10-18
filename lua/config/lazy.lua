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
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

