require("lazy-bootstrap")
require("lazy").setup({
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.dotenv_linter.with({
						filetypes = { "env", "sh" },
					}),
					null_ls.builtins.formatting.prettier.with({
						filetypes = { "sh", "env" },
					}),
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
		"huncholane/leetcode.nvim",
		branch = "huncholane",
		dependencies = { "MunifTanjim/nui.nvim", "tree-sitter/tree-sitter-html" },
		opts = { allow_bufwipe = true },
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
