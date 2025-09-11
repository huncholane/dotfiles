return {
	"stevearc/conform.nvim",
	config = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("conform").format()
			end,
		})
	end,
}
