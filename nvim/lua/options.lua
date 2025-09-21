vim.lsp.enable({
	"luals",
	"pyright",
	"rust",
	"typescript",
})

vim.cmd([[
set showtabline=2
set formatoptions-=cro
set errorformat^=%m@%f
set fdo=
set foldmethod=indent
set noswapfile
set sessionoptions+=globals,localoptions,tabpages,winpos,resize,folds
colorscheme tokyonight-moon
set undofile
let mapleader=" "
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set smartcase
set foldlevel=99
set statusline=%f\ [%{getcwd()}]
set tabline=%!NumberedTabPages()
]])
