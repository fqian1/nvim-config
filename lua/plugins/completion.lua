return {
  {
	"hrsh7th/nvim-cmp",
	dependencies = {
	  "hrsh7th/cmp-nvim-lsp",   -- LSP source for nvim-cmp
	  "hrsh7th/cmp-buffer",      -- Buffer completions
	  "hrsh7th/cmp-path",        -- Path completions
	  "hrsh7th/cmp-cmdline",     -- Cmdline completions
	  "L3MON4D3/LuaSnip",        -- Snippet engine
	  "saadparwaiz1/cmp_luasnip" -- Snippet completions
	},
	config = function()
	  local cmp = require('cmp')
	  local luasnip = require('luasnip')

	  cmp.setup({
		snippet = {
		  expand = function(args)
			luasnip.lsp_expand(args.body)
		  end,
		},
		mapping = {
		  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		  ['<C-f>'] = cmp.mapping.scroll_docs(4),
		  ['<C-Space>'] = cmp.mapping.complete(),
		  ['<C-e>'] = cmp.mapping.abort(),
		  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item.
		  ['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
			  cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
			  luasnip.expand_or_jump()
			else
			  fallback()
			end
		  end, { 'i', 's' }),
		  ['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
			  cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
			  luasnip.jump(-1)
			else
			  fallback()
			end
		  end, { 'i', 's' }),
		},
		sources = cmp.config.sources({
		  { name = 'nvim_lsp' },
		  { name = 'luasnip' }, -- For luasnip users.
		}, {
		  { name = 'buffer' },
		})
	  })

	  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		  { name = 'buffer' }
		}
	  })

	  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		  { name = 'path' }
		}, {
		  { name = 'cmdline' }
		})
	  })

	  -- Setup LSP completion capabilities
	  local capabilities = require('cmp_nvim_lsp').default_capabilities()
	  local lspconfig = require('lspconfig')

	  lspconfig.lua_ls.setup({
		capabilities = capabilities,
	  })

	  lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
	  })
	end
  }
}
