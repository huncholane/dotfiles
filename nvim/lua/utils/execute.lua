local M = {
	target = { path = vim.fn.expand("target"), ft = vim.bo.filetype },
}

local cwd = vim.fn.getcwd()

M.mark = function()
	M.target.path = vim.fn.expand("%")
	M.target.ft = vim.bo.filetype
end

---Runs a given path and filetype
---@param path string absolute path
---@param ft string file type
M.run = function(path, ft)
	vim.cmd("w")
	local relative_path = "./" .. path:gsub("^" .. vim.pesc(cwd), "")
	local basename = path:match("([^/]+)$")
	local stem = basename:match("^(.+)%.") or basename
	if ft == "python" then
		vim.cmd("terminal python " .. relative_path)
	elseif ft == "rust" then
		if path:find("examples/") then
			vim.cmd("terminal cargo run --example " .. stem)
		elseif M.target.path:find("bin/") then
			vim.cmd("terminal cargo run --bin " .. stem)
		elseif M.target.path:find("test/") then
			vim.cmd("terminal cargo test")
		else
			vim.cmd("terminal cargo run")
		end
	elseif ft == "lua" then
		vim.cmd("luafile " .. path)
	else
		vim.cmd("terminal chmod +x " .. relative_path .. "&& " .. relative_path)
	end
end

---Runs the current marked file
M.run_marked = function()
	M.run(M.target.path, M.target.ft)
end

---Runs the current file without marking it
M.run_current = function()
	M.run(vim.fn.expand("%"), vim.bo.filetype)
end

return M
