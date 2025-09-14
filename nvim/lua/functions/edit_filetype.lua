return function ()
    vim.cmd(":e ~/.config/nvim/after/ftplugin/"..vim.bo.filetype)
end
