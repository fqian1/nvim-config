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
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case'
      },
      prompt_prefix = "> ",
      selection_caret = "> ",
      path_display = {"smart"},
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      file_sorter = require("telescope.sorters").get_fzy_sorter,
      file_ignore_patterns = {"node_modules"},
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      winblend = 0,
      border = {},
      borderchars = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
      color_devicons = true,
      use_less = true,
      set_env = { ['COLORTERM'] = 'truecolor' },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
      buffers = {
        theme = "dropdown",
      },
    },
    extensions = {
      frecency = {
        default_workspace = 'CWD',
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = {"*.git/*", "*/tmp/*"},
        workspaces = {
          conf = "~/.config",
          data = "~/.local/share",
          project = "~/projects",
        }
      },
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
      }
    }
  },
  config = function(_, opts)
    require("telescope").setup(opts)

    -- Load extensions
    require('telescope').load_extension('fzy_native')
    require('telescope').load_extension('frecency')
    require('telescope').load_extension('file_browser')
  end
}

