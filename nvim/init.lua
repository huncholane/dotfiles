---lsp
vim.lsp.enable({
	"luals",
	"pyright",
	"rust",
	"typescript",
})

---lazy plugins
require("lazy-bootstrap")
require("lazy").setup({
	{ "nvim-telescope/telescope.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "folke/which-key.nvim" },
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
				javascript = { "prettier" },
				toml = { "taplo" },
				typescriptreact = { "prettier" },
			},
		},
	},
	{ "nvim-treesitter/nvim-treesitter" },
	{ "mason-org/mason.nvim", opts = {} },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"huncholane/leetcode.nvim",
		branch = "huncholane",
		dependencies = { "MunifTanjim/nui.nvim", "tree-sitter/tree-sitter-html" },
		opts = { allow_bufwipe = true },
	},
	{ "windwp/nvim-autopairs", opts = {} },
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "cargo build --release",
		opts = { cmdline = { enabled = false } },
	},
	{ "nvim-mini/mini.ai", opts = {} },
})

---options
vim.cmd([[
set formatoptions-=cro
set errorformat^=%m@%f
set fdo=
set foldmethod=indent
set noswapfile
set sessionoptions+=globals,localoptions,tabpages,winpos,resize,folds
colorscheme tokyonight-moon
set undofile
let mapleader=" "
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set smartcase
set foldlevel=99
set statusline=%f\ [%{getcwd()}]
]])

---keymaps
if true then
	local function easymap(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { desc = desc })
	end
	--leader
	easymap("n", "<leader>k", ":silent! bd!<cr>", "Close Buffer")
	easymap("n", "<leader>b", ":LastFile<cr>", "Last File")
	easymap("n", "<leader>e", ":Ex<cr>", "Explore")
	easymap("n", "<leader>q", ":silent! wa! | silent! qa!<cr>", "Quit")
	easymap("n", "<leader>;", "q:", "Elite Cmd")
	easymap("n", "<leader>f", ":Format<cr>", "Format")
	easymap("n", "<leader>h", ":nohl<cr>", "Remove Highlights")
	easymap("n", "<leader><Space>", ":Telescope find_files<cr>", "Files")
	easymap("n", "<leader>l", ":<C-p><cr>", "Last Command")
	easymap("n", "<leader>/", ":Telescope live_grep<cr>", "Live Grep")
	easymap("n", "<leader>,", ":Telescope buffers<cr>", "Find Buffer")
	easymap("n", "<leader>o", "mz<cmd>%bd|e#|bd#<cr>'z", "Focus")
	easymap("n", "<leader>8", ':exe "resize ".float2nr(&lines*0.8)<cr>', "80% Window")
	easymap("n", "<leader>s", ":Scratch<cr>", "Scratch")

	--quickfix
	easymap("n", "<leader>c", "", "Quick Fix")
	easymap("n", "<leader>cn", ":cnext<cr>", "Next")
	easymap("n", "<leader>cp", ":cprev<cr>", "Prev")
	easymap("n", "<leader>ct", ":ToggleClist<cr>", "Toggle")
	easymap("n", "<leader>cq", ":cclose<cr>", "Close")
	easymap("n", "<leader>co", ":copen<cr>", "Open")
	easymap("n", "<leader>cc", ":cexpr []<cr>", "Clear")

	--telescope
	easymap("n", "<leader>t", "", "Telescope")
	easymap("n", "<leader>ts", ":Telescope treesitter<cr>", "Treesitter")

	--fold
	easymap("n", "<leader>z", "", "Fold")
	easymap("n", "<leader>zt", ":TreeSitterFold<cr>", "Treesitter")
	easymap("n", "<leader>zi", ":IndentFold<cr>", "Indent")
	easymap("n", "<leader>zs", ":SyntaxFold<cr>", "Syntax")

	--windows
	easymap({ "i", "n" }, "<C-h>", "<C-w>h")
	easymap({ "i", "n" }, "<C-j>", "<C-w>j")
	easymap({ "i", "n" }, "<C-k>", "<C-w>k")
	easymap({ "i", "n" }, "<C-l>", "<C-w>l")

	---gotos
	easymap("n", "gd", vim.lsp.buf.definition, "Goto Definition")
	easymap({ "n", "v" }, "gy", '"+y', "System Clipboard Copy")
	easymap({ "n", "v" }, "gp", '"+p', "System Clipboard Paste")
	easymap("n", "gs", "<cmd>EditCurrentFiletype<cr>", "Filetype Settings")
	easymap("n", "gm", "q:?make<cr><cr>", "Last Make")
	easymap("n", "g;", "m'A;<esc>`'", "Append Colon")
	easymap("n", "g,", "m'A,<esc>`'", "Append Comma")

	---quickfix
	easymap("n", "gq", "", "Quickfix")
	easymap("n", "gql", vim.diagnostic.setqflist, "LSP")
	easymap("n", "gqn", vim.diagnostic.goto_next, "Next Diagnostic")
	easymap("n", "gqp", vim.diagnostic.goto_prev, "Prev Diagnostic")

	--extras others
	easymap({ "i", "n" }, "<C-s>", "<cmd>w<cr>", "Format")
end

---commands cmds
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

let g:qfjobs=[]
function! JobHandler(c, d, n) abort
  let lines = filter(copy(a:d), 'v:val !=# ""')
  if empty(lines)
    return
  endif

  " Step 1: save current qf
  let old = getqflist()

  " Step 2: parse new lines into qf entries using errorformat
  cgetexpr lines
  let new = getqflist()

  " Step 3: merge
  let merged = old + new

  " Step 4: set back
  call setqflist(merged, 'r')
endfunction
command! -nargs=+ Qfjob call add(g:qfjobs, [jobstart(<q-args>, {'on_stdout':'JobHandler', 'on_stderr':'JobHandler'}), <q-args>])
command! Killqfjobs for j in g:qfjobs | call jobstop(j[0]) | endfor | set g:qfjobs=[]
command! Restartqfjobs for j in g:qfjobs | call jobstop(j[0]) | let j[0] = jobstart(j[1]) | endfor

autocmd InsertLeave,TextChanged,FocusLost * if &modifiable && !&readonly | silent! wall | endif
silent! !mkdir .nvim -p
autocmd BufWritePre,VimLeavePre * silent! mks! .nvim/session.vim
autocmd VimEnter * %bd | silent! source .nvim/session.vim
autocmd BufNewFile,BufRead buildspec.y{a,}ml set filetype=aws-yml
autocmd BufWritePre * silent! lua require("conform").format()

"let g:lastfile=''
command! LastFile if g:lastfile!='' | execute 'edit '.fnameescape(g:lastfile) | endif
autocmd BufLeave * if &buftype == '' && filereadable(expand('%')) | let lastfile = expand('%:p') | endif
]])
