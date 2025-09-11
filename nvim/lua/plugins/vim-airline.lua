---@type LazySpec
return {
	"vim-airline/vim-airline",
	dependencies = {
		"vim-airline/vim-airline-themes",
		"ryanoasis/vim-devicons",
		"lewis6991/gitsigns.nvim",
		"preservim/tagbar",
		"tpope/vim-fugitive",
	},
	init = function(_)
		vim.g.airline_powerline_fonts = 1
		vim.g["airline#extensions#tabline#enabled"] = 1
		vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
		vim.g["airline#extensions#hunks#enabled"] = 1
		vim.g["airline#extensions#whitespace#enabled"] = 1
		vim.g["airline#extensions#tagbar#enabled"] = 1
		vim.g["airline#extensions#lsp#enabled"] = 1
		vim.g.airline_theme = "deus"
	end,
}
