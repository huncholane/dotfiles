local telescope = require("telescope")
local builtin = require("telescope.builtin")
local mason_ui = require("mason.ui")
local buffer = require("buf-utils.utils")
local execute = require("execute")
local scratch = require("scratch")

-- leader bindings
vim.keymap.set("n", "<leader><Space>", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>q", require("utils.general").safe_exit, { desc = "Quit All" })
vim.keymap.set("n", "<leader>m", mason_ui.open, { desc = "Mason UI" })
vim.keymap.set("n", "<leader>n", ":messages<cr>", { desc = "Notifications" })
vim.keymap.set("n", "<leader>o", ":Oil<cr>", { desc = "Oil" })
vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Search Buffers" })
vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Search Buffers" })

-- buffer bindings
vim.keymap.set("n", "<leader>b", "", { desc = "Buffers" })
vim.keymap.set("n", "<leader>bb", ":b#<cr>", { desc = "Last Buffer" })
vim.keymap.set("n", "<leader>bn", ":bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", ":bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set("n", "<leader>bs", scratch.open, { desc = "Scratchpad" })
vim.keymap.set("n", "<leader>bd", ":bd<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", buffer.delete_other_buffers, { desc = "Delete Others" })
vim.keymap.set("n", "<leader>bq", buffer.wipe, { desc = "Remove All" })
vim.keymap.set("n", "<leader>ba", ":Alpha | BufUtils focus<cr>", { desc = "Alpha" })

-- code bindings
vim.keymap.set("n", "<leader>c", "", { desc = "Code" })
vim.keymap.set("n", "<leader>cc", ":FT<cr>", { desc = "Config" })
vim.keymap.set("n", "<leader>cd", require("plugins.lspconfig").open_float, { desc = "Open Diagnostic" })

-- executable bindings
vim.keymap.set("n", "<leader>e", "", { desc = "Executable" })
vim.keymap.set("n", "<leader>em", execute.mark, { desc = "Mark" })
vim.keymap.set("n", "<leader>ee", execute.run_marked, { desc = "Run Marked" })
vim.keymap.set("n", "<leader>ec", execute.run_current, { desc = "Run Current" })

-- telescope bindings
vim.keymap.set("n", "<leader>t", "", { desc = "Telescope" })
vim.keymap.set("n", "<leader>tt", builtin.builtin, { desc = "Builtin" })
vim.keymap.set("n", "<leader>tf", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>tk", builtin.keymaps, { desc = "Find Keymap" })
vim.keymap.set("n", "<leader>te", telescope.extensions.emoji.emoji, { desc = "Emoji" })
vim.keymap.set("n", "<leader>ta", builtin.autocommands, { desc = "Autocommands" })
vim.keymap.set("n", "<leader>to", ":Telescope oil<cr>", { desc = "Oil" })
vim.keymap.set("n", "<leader>tn", ":Telescope nerdy<cr>", { desc = "Nerd Fonts" })
vim.keymap.set("n", "<leader>tc", ":Telescope ftconfig<cr>", { desc = "Filetype Config" })

-- control bindings
vim.keymap.set({ "i", "n" }, "<C-h>", "<C-w>h", { desc = "Window Left" })
vim.keymap.set({ "i", "n" }, "<C-j>", "<C-w>j", { desc = "Window Down" })
vim.keymap.set({ "i", "n" }, "<C-k>", "<C-w>k", { desc = "Window Up" })
vim.keymap.set({ "i", "n" }, "<C-l>", "<C-w>l", { desc = "Window Right" })
vim.keymap.set({ "i", "n" }, "<C-e>", telescope.extensions.emoji.emoji, { desc = "Emoji" })
vim.keymap.set({ "i", "n" }, "<C-n>", ":bp<cr>", { desc = "Prev Buffer" })
vim.keymap.set({ "i", "n" }, "<C-m>", ":bn<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<C-s>", ":w<cr>", { desc = "Save" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>", { desc = "Save" })

-- cancel bindings
vim.keymap.set("n", "q:", ":", { desc = "Remove stupid ass command" })
