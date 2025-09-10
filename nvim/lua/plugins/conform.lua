return {
	"stevarc/conform.nvim",
	setup = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
			},
			formatters = {
				cargo_fix = {
					command = "cargo",
					args = { "fix", "--allow-dirty" },
					stdin = false,
				},
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("conform").format()
			end,
		})
	end,
}
