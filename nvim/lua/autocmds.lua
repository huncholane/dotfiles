local autosave = require("utils.autosave")

vim.api.nvim_create_autocmd("BufLeave", {
	callback = autosave.save,
})

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
	callback = autosave.save,
})

-- easy exit readonly
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		if vim.bo[args.buf].readonly then
			vim.keymap.set("n", "q", ":q<cr>", { nowait = true, buffer = args.buf })
		end
	end,
})

-- easy exit terminal
vim.api.nvim_create_autocmd("TermOpen", {
	callback = function(args)
		vim.keymap.set("n", "q", ":bd!<cr>", { nowait = true, buffer = args.buf })
		vim.keymap.set("i", "<C-[>", "<C-\\><C-n>", { nowait = true, buffer = args.buf })
	end,
})
