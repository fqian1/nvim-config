return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'tami5/sqlite.lua',
    'nvim-telescope/telescope-frecency.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
  },
  opts = {
    defaults = {
        -- options
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
  end
}