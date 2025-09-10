return {
	"~/code/nvim-plugins/home.nvim",
	-- deps = { "~/code/nvim-plugins/buf-utils.nvim" },
	setup = function()
		require("home").setup()
	end,
}
