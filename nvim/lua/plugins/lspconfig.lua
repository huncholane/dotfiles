---@type LazySpec
return {
	"neovim/nvim-lspconfig",
	dependencies = { "folke/neodev.nvim" },
	config = function()
		require("neodev").setup({})
		-- vim.lsp.config("rust_analyzer", {})
		-- vim.lsp.enable("rust_analyzer")

		vim.diagnostic.config({
			virtual_text = {
				prefix = "💀", -- could be "■", "▎", "x"
				spacing = 2,
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})
	end,
	open_float = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
}
