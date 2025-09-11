local lspconfig = require("lspconfig")

local plugin_paths = {}
for _, plugin in pairs(require("lazy.core.config").plugins) do
	table.insert(plugin_paths, plugin.dir .. "/lua")
end

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					unpack(plugin_paths),
				},
				checkThirdParty = false,
      },
		},
	},
})

---@type FTSpec
return {
	indent = 2,
	conform = {
		use = { "stylua" },
	},
}
