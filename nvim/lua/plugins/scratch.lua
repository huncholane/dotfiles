return {
	"~/code/nvim-plugins/scratch.nvim",
	deps = {"nvim-mini/mini.icons"},
	setup = function()
		require("scratch").setup()
	end,
}
