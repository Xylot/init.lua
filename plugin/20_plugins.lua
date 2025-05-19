
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
    add({
        source = 'nvim-treesitter/nvim-treesitter',
        checkout = 'master',
        monitor = 'main',
        hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
    })

    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'vimdoc', 'yaml', 'python', 'rust', 'typescript' },
        highlight = { enable = true },
    })
end)

later(function()
    add({
        source = 'm4xshen/hardtime.nvim',
        depends = {
            'MunifTanjim/nui.nvim',
        }
    })

    require('hardtime').setup({})
end)
