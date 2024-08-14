local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('v', '<', '<gv', opts)                          -- Stay in visual mode after shifting left
map('v', '>', '>gv', opts)                          -- Stay in visual mode after shifting right
-- map('n', '<leader>c', ':Commentary<CR>', opts)      -- Quickly comment out code with leader+c (requires tpope's commentary plugin)

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, opts)
map('n', '<leader>fg', builtin.live_grep, opts)
map('n', '<leader>fb', builtin.buffers, opts)
map('n', '<leader>fh', builtin.help_tags, opts)