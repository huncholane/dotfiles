local M = {}
M.all = function()
	vim.lsp.buf.code_action({
		range = {
			start = { 1, 1 },
			["end"] = { vim.fn.line("$"), 1 },
		},
	})
end

---Removes all unused imports in rust
M.import = function()
	vim.lsp.buf.code_action({
		apply = true,
		filter = function(x)
			if x.title:match("import") then
				return true
			end
			return false
		end,
		range = {
			start = { 1, 1 },
			["end"] = { vim.fn.line("$"), 1 },
		},
	})
end

return M
