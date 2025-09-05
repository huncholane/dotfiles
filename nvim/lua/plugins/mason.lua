require("utils.plugin").install({ src = "https://github.com/mason-org/mason.nvim" })
local mason = require("mason")
--vim.keymap.set("n", "<leader>m", require("mason.ui").ui.open())

local config = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

mason.setup(config)
