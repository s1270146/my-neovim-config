require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        }
    end,
}

vim.opt.completeopt = "menu,menuone,noselect"
