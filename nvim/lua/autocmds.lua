local function autosave()
	local ignore_ft = { "neo-tree", "", "gitcommit", "help", "qf", "dashboard", "jq", "oil", "TelescopePrompt" }
	if
		not vim.bo.readonly
		and vim.bo.modified
		and not vim.bo.buftype
		and not vim.tbl_contains(ignore_ft, vim.bo.filetype)
	then
		vim.cmd("write")
	end
end

vim.api.nvim_create_autocmd("BufLeave", {
	callback = autosave,
})

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
	callback = autosave,
})
