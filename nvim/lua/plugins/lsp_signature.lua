return {
	"ray-x/lsp_signature.nvim",
	disabled = false,
	event = "InsertEnter",
	config = function()
		local sig = require("lsp_signature")
		sig.setup({
			hint_prefix = "  ",
			floating_window = false,
			toggle_key = "<C-k>",
		})
	end,
}
