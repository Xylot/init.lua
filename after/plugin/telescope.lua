local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Adds a CTRL-B to split file vertically on windows because CTRL-V is taken by OS paste
if vim.fn.has('win32') then
    local actions = require('telescope.actions')
    require('telescope').setup({
        defaults = {
            mappings = { i = { ["<C-b>"] = actions.select_vertical } }
        }
    })
end
