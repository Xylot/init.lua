local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
  require('mini.notify').setup()
  vim.notify = require('mini.notify').make_notify()
end)
now(function() require('mini.icons').setup() end)
now(function() require('mini.tabline').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.completion').setup() end)

now(function()
    require('mini.files').setup({
        mappings = {
            show_help = 'gh',
        }
    })
end)
vim.keymap.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>', {desc = 'File explorer'})

later(function() require('mini.ai').setup() end)
later(function() require('mini.comment').setup() end)
later(function() require('mini.surround').setup() end)
later(function()
    local opts = {}
    if vim.fn.has('win32') then
        opts = {
            mappings = {
                choose_in_vsplit = '<C-b>',
            }
        }
    end

    require('mini.pick').setup(opts)
end)

later(function() require('mini.extra').setup() end)
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<cr>', {desc = 'Search all files'})
vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<cr>', {desc = 'Search open buffers'})
vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<cr>', {desc = 'Search project'})
vim.keymap.set('n', '<leader>fd', '<cmd>Pick diagnostic<cr>', {desc = 'Search diagnostics'})
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<cr>', {desc = 'Search help tags'})

now(function() require('mini.snippets').setup() end)

later(function()
    require('mini.trailspace').setup()

    vim.api.nvim_create_autocmd("BufWrite", {
        callback = function()
            MiniTrailspace.trim()
            MiniTrailspace.trim_last_lines()
        end
    })
end)
