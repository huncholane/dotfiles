local dir = vim.fn.expand("~/code/nvim-plugins/scratch.nvim")

---@type LazySpec
return {
	"huncholane/scratch.nvim",
	dir = vim.fn.isdirectory(dir) == 1 and dir or nil,
	dependencies = { "nvim-mini/mini.icons" },
	config = function()
		require("scratch").setup()
	end,
}
