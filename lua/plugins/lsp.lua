return {
  {
	"williamboman/mason.nvim",
	opts = {}
  },
  {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	opts = {
	  ensure_installed = { "lua_ls", "rust_analyzer" }
	}
  },
  {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
	  "williamboman/mason-lspconfig.nvim",
	},
	config = function()
	  local lspconfig = require("lspconfig")

	  lspconfig.lua_ls.setup({
		settings = {
		  Lua = {
			diagnostics = { globals = { "vim" } },
			runtime = { version = "LuJIT", path = vim.split(package.path, ';' )},
			workspace = {
			  library = {
				[vim.fn.expand('$VIMRUNTIME/lua')] = true,
				[vim.fn.stdpath('config') .. '/lua'] = true
			  }
			},
			completion = { enable = true },
			format = {
			  enable = true,
			  defaultConfig = {
				indent_style = 'tab',
				indent_size = '2',
			  },
			},
			telemetry = { enable = false },
			hint = { enable = true, setType = true }
		  }
		}
	  })

	  lspconfig.rust_analyzer.setup({
		settings = {
		  ['rust-analyzer'] = {
			assist = { importGranularity = "module", importPrefix = "self" },
			rustfmt = { enableRangeFormatting = true },
			lens = { enable = true, debug = true },
			checkOnSave = { command = "clippy" },
			files = { excludeDirs = { ".git", "target" } },
			completion = { addCallArgumentSnippets = true, addCallParenthesis = true },
			procMacro = { enable = true },
			diagnostics = { enable = true, disabled = { "unresolved-import" } },
			cargo = {
			  allFeatures = true,
			  noDefaultFeatures = false,
			  features = { "my_feature" },
			  loadOutDirsFromCheck = true
			},
			inlayHints = {
			  enable = true,
			  chainingHints = true,
			  parameterHints = true,
			  typeHints = true
			},
		  }
		}
	  })
	end
  }
}

