local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=main",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local function islua(file)
	if file:match("%.lua$") then
		return 1
	end
	return 0
end
local files = vim.fn.readdir(plugin_dir, islua)
local plugins = {}
for _, file in ipairs(files) do
	local mod = "plugins." .. vim.fn.fnamemodify(file, ":t:r")
	local ok, plugin = pcall(require, mod)
	if ok then
		table.insert(plugins, plugin)
	end
end
require("lazy.init").setup({
	spec = plugins,
})

require("clipboard")
require("autocmds")
require("keymaps")
