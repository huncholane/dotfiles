local lspconfig = require("lspconfig")
vim.lsp.config
lspconfig.pyright.setup()

---@type FTSpec
return {
	-- conform = {
	-- 	use = { "black" },
	-- },
}
