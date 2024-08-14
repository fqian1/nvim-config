return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = function(_, opts)
      opts.highlight = { enable = true, },
      opts.autopairs = { enable = true },
      opts.textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      }

      opts.indent = {enable = true}
      opts.context_commentstring = {
        enable = true,
        enable_autocmd = false,
      }
    end,
}