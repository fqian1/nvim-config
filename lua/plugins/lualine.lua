return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		icons_enabled = true,
		theme = 'tokyonight'
	},
	config = function(_, opts)
		require('lualine').setup(opts)
	end
}
