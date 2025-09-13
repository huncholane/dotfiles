vim.lsp.config("pyright", {})
vim.lsp.enable("pyright")

---@type FTSpec
return {
	conform = {
		use = { "black" },
	},
}
