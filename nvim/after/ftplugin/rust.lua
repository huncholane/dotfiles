vim.cmd([[
command! -nargs=+ R execute 'set makeprg=cargo\ '.substitute(<q-args>, ' ', '\\ ', 'g').'\ --message-format=short' | make
set makeprg=cargo
set errorformat+=%m\ %f:%l:%c:
set errorformat+=%m@%f
]])
