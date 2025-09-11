local dir = vim.fn.expand("~/code/nvim-plugins/buf-utils.nvim")

---@type LazySpec
return {
	"huncholane/buf-utils.nvim",
	dir = vim.fn.isdirectory(dir) == 1 and dir or nil,
	config = function()
		require("buf-utils").setup()
	end,
}
