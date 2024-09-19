return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {"c", "cpp", "rust", "go", "zig", "asm", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"},
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "v",
          node_incremental = "v",
          scope_incremental = false,
          node_decremental = "V",
        },
      },
      indent = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'v',
            ['@class.outer'] = 'v',
          },
          include_surrounding_whitespace = true,
        },
      },
    })
  end
}
