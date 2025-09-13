local library = vim.api.nvim_get_runtime_file("", true)
for _, file in ipairs(require("lazy").plugins()) do
	table.insert(library, file.dir)
end
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				-- make sure the full path starts with lua/
				-- origin example: choose plugins/lua/cmp/init.lua over plugins/cargo/completions/cmp.lua
				path = {
					"lua/?/init.lua",
					"lua/?.lua",
				},
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = library,
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("lua_ls")

---@type FTSpec
return {
	indent = 2,
	conform = {
		use = { "stylua" },
	},
}
