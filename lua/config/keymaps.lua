local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

map('v', '<', '<gv', opts)                          -- Stay in visual mode after shifting left
map('v', '>', '>gv', opts)                          -- Stay in visual mode after shifting right
-- Ctrl C and Ctrl V binds
map('v', '<C-c>', '"+y', opts)
map('n', '<C-v>', '"+p', opts)
map('v', '<C-v>', '"+p', opts)
map('i', '<C-v>', '<C-r>+', opts)
-- map('n', '<leader>c', ':Commentary<CR>', opts)      -- Quickly comment out code with leader+c (requires tpope's commentary plugin)

local builtin = require('telescope.builtin')
keymap("n", "<space>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
keymap('n', '<leader>ff', builtin.find_files, opts)
keymap('n', '<leader>fg', builtin.live_grep, opts)
keymap('n', '<leader>fb', builtin.buffers, opts)
keymap('n', '<leader>fh', builtin.help_tags, opts)

keymap('n', '<leader>t', ':Neotree toggle<CR>', opts)

keymap('n', '<F5>', function() require('dap').continue() end)
keymap('n', '<F10>', function() require('dap').step_over() end)
keymap('n', '<F11>', function() require('dap').step_into() end)
keymap('n', '<F12>', function() require('dap').step_out() end)
keymap('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
keymap('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
keymap('n', '<Leader>dr', function() require('dap').repl.open() end)
keymap('n', '<Leader>dl', function() require('dap').run_last() end)
keymap({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
keymap({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
keymap('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end)
keymap('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end)


local opts = { buffer = bufnr, noremap = true, silent = true }
keymap('n', 'gD', vim.lsp.buf.declaration, opts)
keymap('n', 'gd', vim.lsp.buf.definition, opts)
keymap('n', 'K', vim.lsp.buf.hover, opts)
keymap('n', 'gi', vim.lsp.buf.implementation, opts)
keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
keymap('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
keymap('n', 'gr', vim.lsp.buf.references, opts)
keymap('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, opts)
