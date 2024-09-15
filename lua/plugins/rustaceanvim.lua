return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
	local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
	local codelldb_path = extension_path .. 'adapter/codelldb'
	local liblldb_path = extension_path .. 'lldb/lib/liblldb'
	local this_os = vim.uv.os_uname().sysname;
	if this_os:find "Windows" then
	  codelldb_path = extension_path .. "adapter\\codelldb.exe"
	  liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
	else
	  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
	end
	local cfg = require('rustaceanvim.config')

	vim.g.rustaceanvim= {
	  dap = {
		adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
	  },
	}
  end,
  {
	'saecki/crates.nvim',
	ft = {"toml"},
	config = function()
	  require("crates").setup {
		completion = {
		  cmp = {
			enabled = true
		  },
		},
	  }
	  require('cmp').setup.buffer({
		sources = { { name = "crates" }}
	  })
	end
  }
}
