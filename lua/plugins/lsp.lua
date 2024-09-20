return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    {"williamboman/mason.nvim",
      opts = {}
    },
    "neovim/nvim-lspconfig",
    { "ms-jpq/coq_nvim", branch = "coq" },
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
  },
  opts = {
    ensure_installed = { "rust_analyzer", "lua_ls" },
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = 'shut-up',
      display = {
        mark_highlight_group = "Pmenu",
        preview = {
          border = "solid",
          positions = { ["north"] = 2, ["east"] = 1, ["south"] = 3,  ["west"] = 4 }
        }
      }
    }
  end,
  config = function()
    local lsp = require("lspconfig")
    local coq = require("coq")

    lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
      on_attach = require("mason-lspconfig").on_attach,
      capabilities = require("mason-lspconfig").capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy"
          }
        }
      }
    }))

    lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
      on_attach = require("mason-lspconfig").on_attach,
      capabilities = require("mason-lspconfig").capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }))
  end
}
