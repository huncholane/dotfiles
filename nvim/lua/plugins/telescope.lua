require("utils.plugin").install({ src = "https://github.com/nvim-telescope/telescope.nvim" })
require("utils.plugin").install({ src = "https://github.com/xiyaowong/telescope-emoji.nvim" })
local telescope = require("telescope")

telescope.setup({
	extensions = {
		emoji = {
			action = function(emoji)
				vim.fn.setreg("*", emoji.value)
				vim.api.nvim_put({ emoji.value }, "c", false, true)
			end,
		},
	},
})
