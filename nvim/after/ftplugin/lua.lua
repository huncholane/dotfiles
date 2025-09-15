vim.cmd[[
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

nnoremap <leader>f :silent! !stylua %<cr>:e!<cr>
]]
