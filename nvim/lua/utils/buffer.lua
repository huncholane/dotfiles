local M = {}

function M.clear_nameless()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "" and vim.fn.bufname(buf) == "" then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end

function M.wipe()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		vim.api.nvim_buf_delete(buf, { force = true })
	end
end

return M
