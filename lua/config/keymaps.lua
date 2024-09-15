local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>pv", ":Ex<CR>", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "J", ":m '>-2<CR>gv=gv", opts)
keymap("v", "J", " mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("x", "<leader>p", "\"_dP", opts)
keymap("n", "<leader>d", "\"_d", opts)
keymap("v", "<leader>d", "\"_d", opts)
keymap("n", "Q", "<nop>", opts)
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<C-q>", "<nop>", opts)
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('v', '<', '<gv', opts)                          -- Stay in visual mode after shifting left
map('v', '>', '>gv', opts)                          -- Stay in visual mode after shifting right
-- Ctrl C and Ctrl V binds
map('v', '<C-c>', '"+y', opts)
map('i', '<C-v>', '<C-r>+', opts)
-- map('n', '<leader>c', ':Commentary<CR>', opts)      -- Quickly comment out code with leader+c (requires tpope's commentary plugin)

local builtin = require('telescope.builtin')
keymap("n", "<space>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
keymap('n', '<leader>ff', builtin.find_files, opts)
keymap('n', '<leader>fg', builtin.live_grep, opts)
keymap('n', '<leader>fb', builtin.buffers, opts)
keymap('n', '<leader>fh', builtin.help_tags, opts)

keymap('n', '<leader>t', ':Neotree toggle<CR>', opts)

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map( "n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

local opts = { buffer = bufnr, noremap = true, silent = true }
keymap('n', 'gD', vim.lsp.buf.declaration, opts)
keymap('n', 'gd', vim.lsp.buf.definition, opts)
keymap('n', 'K', vim.lsp.buf.hover, opts)
keymap('n', 'gi', vim.lsp.buf.implementation, opts)
keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
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
