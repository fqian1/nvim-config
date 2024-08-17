return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    {"ms-jpq/coq_nvim", branch = "coq"},
    { "ms-jpq/coq.artifacts", branch = "artifacts" },
    { "ms-jpq/coq.thirdparty", branch = "3p" }
  },
  init = function()
    vim.g.coq_settings = {
      auto_start = true,
    }
  end,
  config = function()
    local lspconfig = require("lspconfig")
    local coq = require("coq") -- Import COQ

    local on_attach = function(_, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    end

    -- Setup language servers with COQ integration
    lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
      on_attach = on_attach,
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
    }))

    lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({
      on_attach = on_attach,
      settings = {
        ['rust-analyzer'] = {
          assist = { importGranularity = "module", importPrefix = "self" },
          rustfmt = { enableRangeFormatting = true },
          lens = { enable = true, debug = true },
          checkOnSave = { command = "clippy" },
          files = { excludeDirs = { ".git", "target" } },
          completion = { addCallArgumentSnippets = true, addCallParanthesis = true },
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
    }))
  end
}

