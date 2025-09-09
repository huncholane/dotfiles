return {
	"mason-org/mason.nvim",
	setup = function()
		local mason = require("mason")

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
	end,
}
