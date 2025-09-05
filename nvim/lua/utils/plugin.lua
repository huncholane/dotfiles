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

M.install = function(settings)
	local name = settings.name or stem(settings.src)
	local target = install_dir .. "/" .. name

	-- GitHub source
	if settings.src:match("github.com") then
		if vim.fn.isdirectory(target) == 0 then
			vim.notify("Installing " .. name .. " from GitHub", vim.log.levels.INFO)
			vim.fn.system({ "git", "clone", settings.src, target })
		end

	-- Local source
	else
		if vim.fn.isdirectory(target) == 0 then
			vim.notify("Installing " .. name .. " from local path", vim.log.levels.INFO)
			vim.fn.system({ "cp", "-r", settings.src, target })
		else
			run_async({ "rsync", "-a", settings.src .. "/", target })
		end
	end

	vim.cmd("packadd " .. name)
end

return M
