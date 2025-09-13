local autosave = require("utils.autosave")

vim.api.nvim_create_autocmd("BufLeave", {
	callback = autosave.save,
})

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
	callback = autosave.save,
})

local qfiletypes = {
	[""] = true,
}
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		if vim.bo[args.buf].readonly then
			vim.keymap.set("n", "q", ":q<cr>", { nowait = true, buffer = args.buf })
		end
	end,
})
