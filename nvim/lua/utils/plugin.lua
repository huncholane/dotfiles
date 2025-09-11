local M = {}

-- install directory
-- data = ~/.local/share/nvim
local install_dir = vim.fn.stdpath("data") .. "/site/pack/plugins/opt"

-- ensure install_dir exists
if vim.fn.isdirectory(install_dir) == 0 then
	vim.fn.mkdir(install_dir, "p")
end

-- helper: get last path segment
local function stem(src)
	return src:match("([^/]+)$"):gsub("%.git$", "")
end

local function run_async(cmd, on_exit)
	vim.fn.jobstart(cmd, {
		stdout_buffered = true,
		stderr_buffered = true,
		on_stdout = function(_, data)
			if data then
				vim.notify(table.concat(data, "\n"))
			end
		end,
		on_stderr = function(_, data)
			if data then
				vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
			end
		end,
		on_exit = function(_, code)
			if on_exit then
				on_exit(code)
			end
		end,
	})
end

M.install = function(src)
	local name = stem(src)
	local target = install_dir .. "/" .. name
	local git_repo = "https://github.com/" .. src
	src = vim.fn.expand(src)

	if vim.fn.isdirectory(src) == 0 and vim.fn.isdirectory(target) == 0 then
		vim.fn.system({ "git", "clone", git_repo, target })
	elseif vim.fn.isdirectory(src) == 1 and vim.fn.isdirectory(target) == 0 then
		vim.fn.system({ "ln", "-s", src, target })
	end

	return name
end

M.load_graph = function()
	local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"

	-- build graph
	local adj = {}
	for _, file in ipairs(vim.fn.readdir(plugin_dir)) do
		if file:sub(-4) == ".lua" then
			local basename = file:sub(1, -5)
			local mod = "plugins." .. basename
			local ok, plugin = pcall(require, mod)
			if ok and type(plugin) == "table" then
				adj[plugin[1] or basename] = {
					deps = plugin.deps or {},
					setup = plugin.setup or function() end,
					src = plugin[1] or nil,
					key = plugin[1] or basename,
				}
			end
		end
	end
	return adj
end

M.setup = function()
	local adj = M.load_graph()

	-- build indegrees
	local indeg = {}
	for name, node in pairs(adj) do
		indeg[name] = indeg[name] or 0
		for _, dep in ipairs(node.deps) do
			indeg[name] = indeg[name] + 1
			indeg[dep] = indeg[dep] or 0
		end
	end

	-- build 0 q
	local q = {}
	for name, deg in pairs(indeg) do
		if deg == 0 then
			table.insert(q, name)
		end
	end

	-- topsort
	local order = {}
	while #q > 0 do
		local n = table.remove(q, 1)
		table.insert(order, n)
		for other, node in pairs(adj) do
			for _, dep in ipairs(node.deps) do
				if dep == n then
					indeg[other] = indeg[other] - 1
					if indeg[other] == 0 then
						table.insert(q, other)
					end
				end
			end
		end
	end

	-- check errors
	for _, deg in pairs(indeg) do
		if deg > 0 then
			error("Cycle detected in plugin deps")
		end
	end

	-- install plugins in correct order
	for _, key in ipairs(order) do
		local plugin = adj[key]
		if plugin then
			if plugin.src then
				local ok, name = pcall(M.install, plugin.src)
				vim.cmd("packadd " .. name)
			end
			if plugin.setup then
				pcall(plugin.setup)
			end
		else
			pcall(M.install, key)
			vim.cmd("packadd " .. stem(key))
		end
	end
end

return M
