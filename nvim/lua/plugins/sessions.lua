local sessionfile = vim.fn.stdpath("state") .. "/autosession.vim"

-- Save session
local function save_session()
	vim.schedule(function()
		vim.cmd("mksession! " .. vim.fn.fnameescape(sessionfile))
	end)
end

-- Restore session
local function restore_session()
	if vim.fn.filereadable(sessionfile) == 1 then
		vim.cmd("source " .. vim.fn.fnameescape(sessionfile))
		vim.cmd("doautocmd BufReadPost")
	end
end

-- Autocmd: save on write
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = save_session,
})

-- Optional: auto-restore on start
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = restore_session,
})
