local function safe_require(mod)
	local ok, m = pcall(require, mod)
	if not ok then
		vim.notify("Failed to load " .. mod .. ": " .. m, vim.log.levels.WARN)
		return nil
	end
	return m
end

safe_require("plugins.sessions")
safe_require("plugins.tokyo-night")
safe_require("plugins.plenary")
safe_require("plugins.which-key")
safe_require("plugins.mason")
safe_require("plugins.lspconfig")
safe_require("plugins.telescope")
safe_require("plugins.blink")
safe_require("plugins.conform")
safe_require("plugins.vim-airline")
safe_require("plugins.mini-icons")
safe_require("plugins.oil")
safe_require("plugins.oil-git")
safe_require("plugins.oil-git-status")
safe_require("plugins.oil-lsp-diagnostics")
