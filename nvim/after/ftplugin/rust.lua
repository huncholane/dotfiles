vim.cmd([[
"command! -nargs=+ R execute 'set makeprg=cargo\ '.substitute(<q-args>, ' ', '\\ ', 'g').'\ --message-format=short' | make
"set makeprg=RUSTFLAGS=-Awarnings\ cargo
set makeprg=cargo
"set errorformat+=%m\ %f:%l:%c:
set errorformat+=%m@%f
"set formatoptions-=cro

" Enable project specific error messages in stack trace
set efm^=%E%.%#%n:\ %m,%Z\ %.%#at\ \./%f:%l:%c
]])
require("nvim-autopairs").remove_rule("`")
require("nvim-autopairs").remove_rule("'")
