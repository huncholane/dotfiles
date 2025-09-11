local M = {}

function M.set_tabs(tabs)
	vim.opt.shiftwidth = tabs
	vim.opt.tabstop = tabs
	vim.opt.softtabstop = tabs
end

function M.safe_exit()
	require("buf-utils").clear_nameless()
	vim.cmd("wqa!")
end

return M
