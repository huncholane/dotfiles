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

M.delete_other_buffers = function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
			pcall(vim.api.nvim_buf_delete, buf, { force = true })
		end
	end
end

function M.scratch()
	local buf = vim.api.nvim_create_buf(false, true)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})
	-- give it a temp filename so % works
	local tmpfile = vim.fn.tempname() .. ".lua"
	vim.api.nvim_buf_set_name(buf, tmpfile)
	vim.bo[buf].buftype = ""
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].swapfile = false
	vim.bo[buf].buflisted = false
	vim.bo[buf].filetype = "lua"
	vim.keymap.set("n", "q", ":q!<cr>", { buffer = buf, nowait = true })
	vim.keymap.set("n", "<C-c>", ":q!<cr>", { buffer = buf, nowait = true })
	vim.api.nvim_create_autocmd("BufWritePost", {
		buffer = buf,
		callback = function()
			vim.cmd("luafile %")
		end,
	})
end

return M
