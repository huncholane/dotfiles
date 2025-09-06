require("utils.plugin").install({ src = "https://github.com/neovim/nvim-lspconfig" })

return {
	"neovim/nvim-lspconfig",
	setup = function()
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
	end,
}
