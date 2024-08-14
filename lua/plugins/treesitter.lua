return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	opts = {
		ensure_installed = {"c", "cpp", "rust", "go", "zig", "asm" },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}