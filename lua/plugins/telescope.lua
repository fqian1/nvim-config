return {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
		'nvim-telescope/telescope-fzy-native.nvim',
		'nvim-telescope/telescope-frecency.nvim',
		'nvim-telescope/telescope-file-browser.nvim',
	},
	opts = {
		defaults = {},
		extensions = {
			['ui-select'] = {
				require('telescope.themes').get_dropdown(),
			},
		},
	},

	config = function(_, opts)
		require('telescope').setup(opts)
		require('telescope').load_extension('ui-select')
		require('telescope').load_extension('fzy_native')			-- Will be used automatically
		require('telescope').load_extension('frecency')				-- Will be used automatically
		require('telescope').load_extension('file_browser')
	end
}
