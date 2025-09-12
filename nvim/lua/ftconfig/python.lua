vim.lsp.config("pyright", {})
vim.lsp.setup("pyright")

---@type FTSpec
return {
	conform = {
		use = { "black" },
	},
}
