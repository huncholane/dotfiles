local autosave = require("utils.autosave")

vim.api.nvim_create_autocmd("BufLeave", {
	callback = autosave.save,
})

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
	callback = autosave.save,
})

vim.api.nvim_create_autocmd("BufEnter", {
	filetype = nil,
	callback = function(args)
		vim.keymap.set("n", "q", ":bd<cr>", { desc = "Bail", buffer = args.buf, nowait = true })
	end,
})

