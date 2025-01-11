return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		dimInactive = true,
		theme = "dragon",
	},
	config = function()
		require("kanagawa").setup({
			overrides = function(colors)
				local theme = colors.theme
				return {
					TelescopeTitle = { fg = theme.ui.special, bold = true },
					TelescopePromptNormal = { bg = theme.ui.bg_p1 },
					TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
					TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
					TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
					TelescopePreviewNormal = { bg = theme.ui.bg_dim },
					TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = vim.o.pumblend },
					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2, blend = vim.o.pumblend },
					PmenuSbar = { bg = theme.ui.bg_m1 },
					PmenuThumb = { bg = theme.ui.bg_p2 },
				}
			end,
		})
		vim.cmd("colorscheme kanagawa-dragon")
	end,
}
