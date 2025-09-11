---@type LazySpec
return {
    "huncholane/sessions.nvim",
	dir="~/code/nvim-plugins/sessions.nvim",
	config = function()
		require("sessions").setup()
	end,
}
