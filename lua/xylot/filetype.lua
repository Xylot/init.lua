local zsh_extensions = vim.api.nvim_create_augroup('zsh_extensions', {})

local zsh_filetypes = {
    '*.zaliases',
    '*.zprofile',
    '*.zplugins',
    '*.zabbreviations',
}

local autocmd = vim.api.nvim_create_autocmd
autocmd({ 'BufNewFile', 'BufRead' }, {
    group = zsh_extensions,
    pattern = table.concat(zsh_filetypes, ','),
    callback = function()
        vim.cmd.setfiletype('zsh')
    end,
})
