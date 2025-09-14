local dir = vim.fn.expand("~/code/nvim-plugins/execute.nvim")

---@type LazySpec
return {
	{
		"huncholane/execute",
		dir = vim.fn.isdirectory(dir) == 1 and dir or nil,
	},
}
