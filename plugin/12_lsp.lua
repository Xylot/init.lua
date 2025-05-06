local add, now = MiniDeps.add, MiniDeps.now

now(function()
    add('williamboman/mason.nvim')
    add({
        source = 'williamboman/mason-lspconfig.nvim',
        depends = { 'williamboman/mason.nvim' }
    })
    add({
        source = 'neovim/nvim-lspconfig',
        depends = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            'lua_ls', 'basedpyright', 'rust_analyzer', 'bashls', 'html', 'cssls', 'ts_ls', 'yamlls',
        },
        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,

            ["lua_ls"] = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                }
            end,
        }
    })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end)
end)
