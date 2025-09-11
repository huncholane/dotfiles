local lspconfig = require("lspconfig")

local plugin_paths = {}
for _, plugin in pairs(require("lazy.core.config").plugins) do
	table.insert(plugin_paths, plugin.dir .. "/lua")
end

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					table.unpack(plugin_paths),
				},
				checkThirdParty = false,
			},
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
