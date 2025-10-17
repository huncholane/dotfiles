local diagnostics_enabled = true
vim.api.nvim_create_user_command("ToggleDiagnostics", function(_)
  vim.diagnostic.enable(not diagnostics_enabled)
end, { desc = "Toggles Diagnostics" })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".env*",
  callback = function(_)
    vim.bo.filetype = "env"
    vim.bo.syntax = "sh"
  end
})

local last_buf = nil
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function(args)
    local buf = vim.bo[args.buf]
    if buf.buflisted and vim.api.nvim_buf_is_valid(args.buf) and not buf.readonly then
      last_buf = args.buf
    end
  end,
})
vim.api.nvim_create_user_command("LastFile", function()
  if last_buf and vim.api.nvim_buf_is_valid(last_buf) then
    vim.api.nvim_set_current_buf(last_buf)
  else
    vim.notify("No last buffer recorded", vim.log.levels.WARN)
  end
end, {})

vim.cmd([[
command! -nargs=+ SetMakePrg execute 'set makeprg='.substitute(<q-args>, ' ', '\\ ', 'g')
command! ToggleClist if empty(filter(getwininfo(), 'v:val.quickfix')) | copen | else | cclose | endif
command! EditCurrentFiletype execute 'edit ~/.config/nvim/after/ftplugin/'.&filetype.'.lua'
command! Format lua require("conform").format()
command! TreeSitterFold setlocal foldexpr=v:lua.vim.treesitter.foldexpr() | setlocal foldmethod=expr
command! IndentFold setlocal foldmethod=indent
command! SyntaxFold setlocal foldmethod=syntax
command! -nargs=* Scratch enew | setlocal buftype=nofile bufhidden=hide noswapfile
command! -nargs=+ R enew | setlocal buftype=nofile bufhidden=hide noswapfile | silent read !<args>
command! -nargs=+ LinesOfCode execute '!find ./'.substitute(split(<q-args>)[0], ',', ' ./', '-g').' -name "*.'.substitute(split(<q-args>)[1], ',', '" -o -name "*.', 'g').'" | xargs wc -l'
command! SafeBD if winnr('$')==1 | echoerr 'Refuse to close last window' | else | silent! bd! | endif
command! -nargs=* TN tabe | tcd <args>
command! -nargs=+ Qfjob call add(g:qfjobs, [jobstart(<q-args>, {'on_stdout':'JobHandler', 'on_stderr':'JobHandler'}), <q-args>])
command! Killqfjobs for j in g:qfjobs | call jobstop(j[0]) | endfor | set g:qfjobs=[]
command! Restartqfjobs for j in g:qfjobs | call jobstop(j[0]) | let j[0] = jobstart(j[1]) | endfor
command! -nargs=1 Resize silent! exe 'resize '.(&lines*<args>/100)
command! -nargs=1 DotfilesTab tabnew | exe 'tcd ~/.dotfiles/'.<q-args>
command! -nargs=1 Tab tabnew | exe 'tcd '.<q-args>

autocmd InsertLeave,TextChanged,FocusLost * if &modifiable && !&readonly | silent! wall | endif
silent! !mkdir .nvim -p
autocmd BufWritePre * silent! lua vim.lsp.buf.format()
]])
