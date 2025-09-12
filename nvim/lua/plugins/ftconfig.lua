local dir = vim.fn.expand("~/code/nvim-plugins/ftconfig.nvim")

---@type LazySpec
return {
	"huncholane/ftconfig.nvim",
	dir = vim.fn.isdirectory(dir) == 1 and dir or nil,
	config = function()
		require("ftconfig").setup()
	end,
}
