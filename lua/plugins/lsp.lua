return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {"williamboman/mason.nvim",
      opts = {}
    },
    "neovim/nvim-lspconfig"
  },
  opts = {
    ensure_installed = { "rust_analyzer", "lua_ls" },
  },
  config = function()
    require("lspconfig").rust_analyzer.setup({
      on_attach = require("mason-lspconfig").on_attach,
      capabilities = require("mason-lspconfig").capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy"
          }
        }
      }
    })
    require("lspconfig").lua_ls.setup({
      on_attach = require("mason-lspconfig").on_attach,
      capabilities = require("mason-lspconfig").capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })
  end
}
