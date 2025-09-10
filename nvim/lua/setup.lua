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
