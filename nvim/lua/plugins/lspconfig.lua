return {
	"neovim/nvim-lspconfig",
	setup = function()
		vim.lsp.config("rust_analyzer", {})
		vim.lsp.enable("rust_analyzer")

		vim.lsp.enable("pyright")

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }, -- stop "undefined global 'vim'"
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

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
		vim.o.updatetime = 300
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.diagnostic.open_float(nil, { focus = false })
			end,
		})
	end,
}
