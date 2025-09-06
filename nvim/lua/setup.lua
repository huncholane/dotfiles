-- local function safe_require(mod)
-- 	local ok, m = pcall(require, mod)
-- 	if not ok then
-- 		vim.notify("Failed to load " .. mod .. ": " .. m, vim.log.levels.WARN)
-- 		return nil
-- 	end
-- 	return m
-- end
--
-- safe_require("plugins.sessions")
-- safe_require("plugins.tokyo-night")
-- safe_require("plugins.plenary")
-- safe_require("plugins.which-key")
-- safe_require("plugins.mason")
-- safe_require("plugins.lspconfig")
-- safe_require("plugins.telescope")
-- safe_require("plugins.blink")
-- safe_require("plugins.conform")
-- safe_require("plugins.vim-airline")
-- safe_require("plugins.mini-icons")
-- safe_require("plugins.oil")
-- safe_require("plugins.oil-git")
-- safe_require("plugins.oil-git-status")
-- safe_require("plugins.oil-lsp-diagnostics")
require("utils.plugin").setup()

-- Get the path to your config/filetypes directory
local base_dir = vim.fn.stdpath("config") .. "/lua/filetypes"

-- Enumerate all .lua files inside that folder
for _, file in ipairs(vim.fn.readdir(base_dir, [[v:val =~ '\.lua$']])) do
	-- Strip the `.lua` extension
	local ft = file:gsub("%.lua$", "")
	-- Create an autocmd for this filetype
	vim.api.nvim_create_autocmd("FileType", {
		pattern = ft,
		group = vim.api.nvim_create_augroup("filetype_autocommands", { clear = false }),
		callback = function()
			require("filetypes." .. ft)
		end,
	})
end

require("clipboard")
require("autocmds")
require("keymaps")
