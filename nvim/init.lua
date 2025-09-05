vim.o.number = true
vim.opt.expandtab = true
vim.g.mapleader = " "
vim.g.maplocalleader = ","
require("utils.general").set_tabs(4)
require("clipboard")

require("plugins.zzz")
require("filetypes.zzz")
require("autocmds")
require("keymaps")
