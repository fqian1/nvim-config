return {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  branch = '0.1.x',
  dependencies = {
	'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope-ui-select.nvim' },
	{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	'nvim-telescope/telescope-fzy-native.nvim',
	'nvim-telescope/telescope-frecency.nvim',
	'nvim-telescope/telescope-file-browser.nvim',
  },

  opts = function()
	local actions = require('telescope.actions')
	return {
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
		prompt_prefix = "🔍 ",
		selection_caret = "➜ ",
		entry_prefix = "  ",
		initial_mode = "insert",
		sort_mru = true,
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
		  horizontal = {
			preview_width = 0.6,
			results_width = 0.8,
		  },
		  width = 0.9,
		  height = 0.9,
		  preview_cutoff = 120,
		},
		file_ignore_patterns = { "node_modules", ".git/" },
		winblend = 10,
		border = {},
		path_display = { "truncate" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		mappings = {
		  i = {},
		  n = {
			["x"] = actions.select_horizontal,
			["v"] = actions.select_vertical,
			["t"] = actions.select_tab,
			["J"] = actions.preview_scrolling_down,
			["K"] = actions.preview_scrolling_up,
		  }
		}
	  },
	  extensions = {
		['ui-select'] = {
		  require('telescope.themes').get_dropdown({
			layout_config = { width = 0.5, height = 0.4 },
			previewer = false,
			shorten_path = true,
		  })
		},
		fzy_native = {
		  override_generic_sorter = false,
		  override_file_sorter = true,
		},
		frecency = {
		  default_workspace = 'CWD',
		  show_scores = true,
		  show_unindexed = false,
		  ignore_patterns = { "*.git/*", "*/tmp/*" },
		},
		file_browser = {
		  hijack_netrw = true,
		  hidden = true,
		  respect_gitignore = false,
		  select_buffer = true,
		  search_dirs = {"src", "include"},
		  recurse_subdirs = true,
		},
	  }
	}
  end,

  config = function(_, opts)
	require('telescope').setup(opts)
	require('telescope').load_extension('ui-select')
	require('telescope').load_extension('fzy_native')			-- Will be used automatically
	require('telescope').load_extension('frecency')				-- Will be used automatically
	require('telescope').load_extension('file_browser')
  end
}
