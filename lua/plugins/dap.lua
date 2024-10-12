return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  opts = {},
  config = function()
    local dap = require('dap')
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { noremap = true })
    vim.keymap.set('n', '<leader>dc', dap.continue, { noremap = true })
  end
}
