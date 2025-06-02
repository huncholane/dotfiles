require("lazy.types")
---@type LazySpec
return {
  dir = vim.fn.expand("~/code/nvim-plugins/syncmap/"),
  name = "syncmap.nvim",
  config = function()
    require("syncmap").setup()
  end,
}
