local map = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

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

-- jump to next/previous diagnostic
keymap("n", "<leader>j", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lprev<CR>zz", opts)

-- these are not useful
keymap("n", "Q", "<nop>", opts)
keymap("n", "<C-q>", "<nop>", opts)

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- move focus
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- stay in visual mode after shifts
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- copy to clipboard with ctrl+c
map('v', '<C-c>', '"+y', opts)

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map("n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

local builtin = require('telescope.builtin')
keymap("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
keymap('n', '<leader>f', builtin.find_files, opts)
keymap('n', '<leader>g', builtin.live_grep, opts)
keymap('n', '<leader>b', builtin.buffers, opts)
keymap('n', '<leader>h', builtin.help_tags, opts)
