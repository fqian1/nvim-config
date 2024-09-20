return {
  'stevearc/conform.nvim',
  opts = {
    lua = { 'stylua' },
    rust = { 'rustfmt', lsp_format = 'fallback', }
  },
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end
}
