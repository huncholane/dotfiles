vim.lsp.config("rust_analyzer", {})
vim.lsp.enable("rust_analyzer")

---@type FTSpec
return {
	conform = {
		use = { "rustfmt" },
		-- 	formatters = {
		-- 		cargo_fix = {
		-- 			command = "cargo",
		-- 			args = { "fix", "--allow-derty" },
		-- 			stdin = false,
		-- 		},
		-- 	},
	},
}
