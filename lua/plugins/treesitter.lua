return {
	-- Core Treesitter plugin
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	opts = {
		-- Ensure these languages are installed
		sync_install = false,
		auto_install = true,
		ensure_installed = {"c", "cpp", "rust", "go", "zig", "asm"},
		highlight = {
			enable = true, -- Enables syntax highlighting using Treesitter
			additional_vim_regex_highlighting = false, -- Disable regex highlighting, which can conflict with Treesitter
		},
		indent = {
			enable = true, -- Enables Treesitter-based indentation
		},
		incremental_selection = {
			enable = true, -- Enables incremental selection based on the syntax tree
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Jump forward to text objects
				keymaps = {
					["af"] = "@function.outer", -- Select outer part of a function
					["if"] = "@function.inner", -- Select inner part of a function
					["ac"] = "@class.outer",    -- Select outer part of a class
					["ic"] = "@class.inner",    -- Select inner part of a class
					["ap"] = "@parameter.outer", -- Select outer part of a parameter
					["ip"] = "@parameter.inner", -- Select inner part of a parameter
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- Whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
		},
		refactor = {
			highlight_definitions = { enable = true }, -- Highlights the definition of the symbol under the cursor
			highlight_current_scope = { enable = true }, -- Highlights the current scope
			smart_rename = {
				enable = true,
				keymaps = {
					smart_rename = "grr", -- Smart rename, updates all references
				},
			},
			navigation = {
				enable = true,
				keymaps = {
					goto_definition = "gnd", -- Go to definition
					list_definitions = "gnD", -- List all definitions in the file
				},
			},
		},
		playground = {
			enable = true, -- Enables Treesitter Playground for inspecting the syntax tree
			updatetime = 25, -- Debounce time for highlighting nodes in the playground
			persist_queries = false, -- Whether the query persists across vim sessions
		},
		matchup = {
			enable = true, -- Enables matching of function names and pairs
		},
	},
	-- Plugin dependencies for additional functionality
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects", -- Provides more advanced text objects
		"nvim-treesitter/playground", -- Treesitter Playground for viewing the syntax tree
		"andymass/vim-matchup", -- Enhances % matching to navigate between matching pairs
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end
}
