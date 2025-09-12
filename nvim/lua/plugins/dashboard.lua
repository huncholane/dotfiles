vim.api.nvim_set_hl(0, "HygoOrange", { fg = "#ff8800", bold = true })

local asci = {
	huncho_money = [[ 
 /$$   /$$ /$$   /$$ /$$   /$$  /$$$$$$  /$$   /$$  /$$$$$$ 
| $$  | $$| $$  | $$| $$$ | $$ /$$__  $$| $$  | $$ /$$__  $$
| $$  | $$| $$  | $$| $$$$| $$| $$  \__/| $$  | $$| $$  \ $$
| $$$$$$$$| $$  | $$| $$ $$ $$| $$      | $$$$$$$$| $$  | $$
| $$__  $$| $$  | $$| $$  $$$$| $$      | $$__  $$| $$  | $$
| $$  | $$| $$  | $$| $$\  $$$| $$    $$| $$  | $$| $$  | $$
| $$  | $$|  $$$$$$/| $$ \  $$|  $$$$$$/| $$  | $$|  $$$$$$/
|__/  |__/ \______/ |__/  \__/ \______/ |__/  |__/ \______/ 
  ]],
	huncho_blur = [[ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░  
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░  
  ]],
}
---@type LazySpec
return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons", "nvim-lua/plenary.nvim" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local theta = require("alpha.themes.theta")
			theta.header.val = vim.split(asci.huncho_money, "\n")
			theta.header.opts.hl = "HygoOrange"
			table.insert(theta.buttons.val, 3, dashboard.button("f", "  Telescope", "<cmd>Telescope find_files<cr>"))
			alpha.setup(theta.config)
		end,
	},
}
