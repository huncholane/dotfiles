vim.lsp.config("rust_analyzer", {})
vim.lsp.enable("rust_analyzer")

---@type FTSpec
return {
	conform = {
		use = { "rustfmt" },
		formatters = {
			cargo_fix = {
				meta = { description = "Uses cargo fix", url = "" },
				command = "cargo",
				args = { "fix", "--allow-dirty", "--allow-staged" },
				stdin = false,
			},
		},
	},
}
