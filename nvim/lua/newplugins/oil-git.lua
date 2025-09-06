return {
	"benomahony/oil-git.nvim",
	setup = function()
		require("oil-git").setup({
			highlights = {
				OilGitAdded = { fg = "#a6e3a1" }, -- green
				OilGitModified = { fg = "#f9e2af" }, -- yellow
				OilGitRenamed = { fg = "#cba6f7" }, -- purple
				OilGitUntracked = { fg = "#89b4fa" }, -- blue
				OilGitIgnored = { fg = "#6c7086" }, -- gray
			},
		})
	end,
}
