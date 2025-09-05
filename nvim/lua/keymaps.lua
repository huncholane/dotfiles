local builtin = require("telescope.builtin")
local mason_ui = require("mason.ui")

vim.keymap.set("n", "<leader><Space>", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "Find Keymap" })
vim.keymap.set("n", "<leader>q", require("utils.general").safe_exit, { desc = "Quit All" })
vim.keymap.set("n", "<leader>,", ":b#<cr>", { desc = "Last Buffer" })
vim.keymap.set("n", "<leader>m", mason_ui.open, { desc = "Mason UI" })

vim.keymap.set("n", "<M-h>", ":bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<M-l>", ":bn<cr>", { desc = "Next Buffer" })

vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>", { desc = "Save" })

vim.keymap.set("n", "q:", ":", { desc = "Remove stupid ass command" })
