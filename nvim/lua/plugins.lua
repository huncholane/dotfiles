require("lazy-bootstrap")
require("lazy").setup({
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			{ "huncholane/none-ls-extras.nvim", branch = "mbake" },
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					require("null-ls.builtins.diagnostics.dotenv_linter").with({
						filetypes = { "env" },
					}),
					require("null-ls.builtins.formatting.prettier").with({
						filetypes = { "sh", "env" },
					}),
					require("none-ls.formatting.mbake"),
					require("null-ls.builtins.diagnostics.checkmake"),
				},
			})
		end,
	},
	{ "nvim-telescope/telescope.nvim" },
	{ "folke/tokyonight.nvim" },
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").add({
				{ "<leader>w", proxy = "<c-w>", group = "windows" },
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				toml = { "taplo" },
				typescriptreact = { "prettier" },
			},
		},
	},
	{ "nvim-treesitter/nvim-treesitter" },
	{ "mason-org/mason.nvim", opts = {} },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"kawre/leetcode.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "tree-sitter/tree-sitter-html" },
		opts = {},
	},
	{ "windwp/nvim-autopairs", opts = {} },
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "cargo build --release",
		opts = { cmdline = { enabled = false } },
	},
	{ "nvim-mini/mini.ai", opts = {} },
})
