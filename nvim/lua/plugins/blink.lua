require("utils.plugin").install({ src = "https://github.com/hrsh7th/nvim-lspconfig" })
require("utils.plugin").install({ src = "https://github.com/hrsh7th/cmp-nvim-lsp" })
require("utils.plugin").install({ src = "https://github.com/hrsh7th/cmp-buffer" })
require("utils.plugin").install({ src = "https://github.com/hrsh7th/cmp-path" })
require("utils.plugin").install({ src = "https://github.com/hrsh7th/cmp-cmdline" })
require("utils.plugin").install({ src = "https://github.com/hrsh7th/nvim-cmp" })

require("utils.plugin").install({ src = "https://github.com/hrsh7th/cmp-vsnip" })
require("utils.plugin").install({ src = "https://github.com/hrsh7th/vim-vsnip" })

local cmp = require("cmp")
cmp.setup({
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})
