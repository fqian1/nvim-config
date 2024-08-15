local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('v', '<', '<gv', opts)                          -- Stay in visual mode after shifting left
map('v', '>', '>gv', opts)                          -- Stay in visual mode after shifting right
-- map('n', '<leader>c', ':Commentary<CR>', opts)      -- Quickly comment out code with leader+c (requires tpope's commentary plugin)

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<space>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>', opts)

-- Ctrl C and Ctrl V binds
map('v', '<C-c>', '"+y', opts)
map('n', '<C-v>', '"+p', opts)
map('v', '<C-v>', '"+p', opts)
map('i', '<C-v>', '<C-r>+', opts)

