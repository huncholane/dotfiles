vim.lsp.config("pyright", {})
vim.lsp.enable("pyright")
vim.lsp.enable("ruff")

return {
	conform = {
		use = { "ruff_fix", "ruff_organize_imports", "black" },
	},
}
