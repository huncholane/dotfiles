local telescope = require("telescope")
local builtin = require("telescope.builtin")
local mason_ui = require("mason.ui")

vim.keymap.set("n", "<leader><Space>", builtin.find_files, { desc = "Find File" })

vim.keymap.set("n", "<leader>q", require("utils.general").safe_exit, { desc = "Quit All" })
vim.keymap.set("n", "<leader>m", mason_ui.open, { desc = "Mason UI" })
vim.keymap.set("n", "<leader>n", ":messages<cr>", { desc = "Notifications" })
vim.keymap.set("n", "<leader>o", ":Oil<cr>", { desc = "Oil" })

vim.keymap.set("n", "<leader>t", builtin.find_files, { desc = "Telescope" })
vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>tk", builtin.keymaps, { desc = "Find Keymap" })

vim.keymap.set("n", "<leader>b", "", { desc = "Buffers" })
vim.keymap.set("n", "<leader>bb", ":b#<cr>", { desc = "Last Buffer" })
vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>bs", require("utils.buffer").scratch, { desc = "Scratchpad" })

vim.keymap.set("n", "<M-h>", ":bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<M-l>", ":bn<cr>", { desc = "Next Buffer" })

vim.keymap.set({ "i", "n" }, "<C-e>", telescope.extensions.emoji.emoji, { desc = "Emoji" })
vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>", { desc = "Save" })

vim.keymap.set("n", "q:", ":", { desc = "Remove stupid ass command" })
