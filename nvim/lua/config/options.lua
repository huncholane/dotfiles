-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- disable completions with ai
vim.g.ai_cmp = false

-- disable swap files, not needed with autosession
vim.opt.swapfile = false

-- wayland settings
if vim.fn.getenv("WAYLAND_DISPLAY") ~= vim.NIL then
  -- vim.notify("Wayland detected")

  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = 1,
  }
end

-- disable animations
vim.g.snacks_animate = false

-- set normal numbers
vim.cmd("set norelativenumber")

-- fold basic comments
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldopen = ""
-- vim.opt.foldexpr = "v:lua.CommentFoldExpr()"

-- add suggested options for autosession
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    local bufname = vim.api.nvim_buf_get_name(args.buf)
    if bufname:match("site%-packages") then
      vim.diagnostic.enable(false, { bufnr = args.buf })
    end
  end,
})
