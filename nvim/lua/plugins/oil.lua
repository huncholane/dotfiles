---@type LazySpec
return {
	"stevearc/oil.nvim",
	enabled = false,
	dependencies = {
		"JezerM/oil-lsp-diagnostics.nvim",
		"refractalize/oil-git-status.nvim",
		"benomahony/oil-git.nvim",
	},
	config = function()
		--- @type oil.setupOpts
		local setup = {}
		setup.default_file_explorer = true
		setup.columns = { "icon" }
		setup.skip_confirm_for_simple_edits = true
		setup.prompt_save_on_select_new_entry = false
		setup.constrain_cursor = "editable"
		local function safe_enter()
			if vim.bo.modified then
				vim.cmd("w")
				print("Save required, enter once more")
			else
				require("oil").select()
			end
		end
		setup.keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = { safe_enter, mode = "n" },
			["<C-s>"] = ":w<cr>",
			["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = { "i", "n" }, nowait = true },
			["q"] = { "actions.close", mode = "n", nowait = true },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		}
		require("oil").setup(setup)

		require("oil-git-status").setup({
			show_ignored = true, -- show files that match gitignore with !!
			symbols = { -- customize the symbols that appear in the git status columns
				index = {
					["!"] = "!",
					["?"] = "?",
					["A"] = "A",
					["C"] = "C",
					["D"] = "D",
					["M"] = "M",
					["R"] = "R",
					["T"] = "T",
					["U"] = "U",
					[" "] = " ",
				},
				working_tree = {
					["!"] = "!",
					["?"] = "?",
					["A"] = "A",
					["C"] = "C",
					["D"] = "D",
					["M"] = "M",
					["R"] = "R",
					["T"] = "T",
					["U"] = "U",
					[" "] = " ",
				},
			},
		})
		require("oil-git").setup({
			highlights = {
				OilGitAdded = { fg = "#a6e3a1" }, -- green
				OilGitModified = { fg = "#f9e2af" }, -- yellow
				OilGitRenamed = { fg = "#cba6f7" }, -- purple
				OilGitUntracked = { fg = "#89b4fa" }, -- blue
				OilGitIgnored = { fg = "#6c7086" }, -- gray
			},
		})
	end,
}
