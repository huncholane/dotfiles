local library = vim.api.nvim_get_runtime_file("", true)

---@type FTSpec
return {
	indent = 2,
	conform = {
		use = { "stylua" },
	},
	lsp = {
		lua_ls = {
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
					workspace = {
						library = library,
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		},
	},
}
