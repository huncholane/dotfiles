---@type LazySpec
return {
	{
		"nvim-mini/mini.pairs",
		enabled = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		enabled = false,
		event = "InsertEnter",
		config = true,
	},
}
