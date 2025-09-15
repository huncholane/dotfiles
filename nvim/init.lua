vim.cmd([[
let mapleader = " "
set number
colorscheme vim
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

nnoremap <leader>b :b#<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>p :cprev<cr>
nnoremap <leader>e :Ex<cr>
nnoremap <leader>q :wqa!<cr>
nnoremap <leader>c :execute 'edit ~/.config/nvim/after/ftplugin/' . &filetype . '.lua'<cr>

autocmd InsertLeave,TextChanged,FocusLost * if &modifiable && !&readonly | silent! wall | endif
autocmd BufWritePost * silent! !ctags -R --fields=+ns .
]])
