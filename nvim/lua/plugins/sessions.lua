---@type LazySpec
return {
	dir="~/code/nvim-plugins/sessions.nvim",
	config = function()
		require("sessions").setup()
	end,
}
