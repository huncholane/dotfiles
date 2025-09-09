local M = {}

local ignore_ft = { "neo-tree", "", "gitcommit", "help", "qf", "dashboard", "jq", "oil", "TelescopePrompt" }

---@param args vim.api.keyset.create_autocmd.callback_args
M.save = function(args)
	-- buffer options
	local opt = vim.bo[args.buf]

	-- buffer state
	local info = vim.fn.getbufinfo(args.buf)[1]
	if not info then
		return
	end

	if
		opt.readonly == false
		and info.changed == 1
		and opt.buftype == ""
		and not vim.tbl_contains(ignore_ft, opt.filetype)
	then
		vim.api.nvim_buf_call(args.buf, function()
			vim.cmd("silent write")
		end)
	end
end

return M
