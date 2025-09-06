return {
	"nvim-telescope/telescope.nvim",
	deps = { "xiyaowong/telescope-emoji.nvim", "nvim-lua/plenary.nvim" },
	setup = function()
		local telescope = require("telescope")

		-- telescope.setup({
		-- 	extensions = {
		-- 		emoji = {
		-- 			action = function(emoji)
		-- 				vim.fn.setreg("*", emoji.value)
		-- 				vim.api.nvim_put({ emoji.value }, "c", false, true)
		-- 			end,
		-- 		},
		-- 	},
		-- })
	end,
}
