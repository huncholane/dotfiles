if false then
  require("syncmap.types")
  require("lazy.types")
end

local use_dev = true

---@type SyncmapOpts
local opts = {
  map = {
    { "~/.dotfiles/nvim/", "~/.config/nvim/" },
    { "~/.dotfiles/tmux/", "~/.config/tmux/" },
    { "~/.dotfiles/hypr/", "~/.config/hypr/" },
    { "~/.dotfiles/kitty/", "~/.config/kitty/" },
    { "~/.dotfiles/tmux-powerline/", "~/.config/tmux-powerline/" },
    { "~/.dotfiles/waybar/", "~/.config/waybar/" },
    { "~/.dotfiles/wezterm/", "~/.config/wezterm/" },
    { "~/.dotfiles/.oh-my-zsh/", "~/.oh-my-zsh/" },
    { "~/.dotfiles/.zshrc", "~/.zshrc" },
  },
  exclude_from = ".gitignore",
  log_level = "info",
}

---@type LazySpec
local dev = {
  dir = vim.fn.expand("~/code/nvim-plugins/syncmap/"),
  name = "syncmap.nvim",
  opts = opts,
}

---@type LazySpec
local prod = {
  "huncholane/syncmap.nvim",
  ---@type SyncmapOpts
  opts = opts,
}

return use_dev and dev or prod
