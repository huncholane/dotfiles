require("lazy-bootstrap")
require("lazy").setup({
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      { "nvimtools/none-ls-extras.nvim" },
    },
    -- dependencies = {
    --   { dir = "~/code/contributions/none-ls-extras.nvim" },
    -- },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          require("null-ls.builtins.diagnostics.dotenv_linter").with({
            filetypes = { "env" },
          }),
          require("null-ls.builtins.formatting.prettier").with({
            filetypes = { "sh", "env" },
          }),
          require("none-ls.formatting.mbake"),
          require("null-ls.builtins.diagnostics.checkmake"),
          require("null-ls.builtins.formatting.isort"),
          require("none-ls.formatting.taplo"),
        },
      })
    end,
  },
  { "nvim-telescope/telescope.nvim" },
  { "folke/tokyonight.nvim" },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").add({
        { "<leader>w", proxy = "<c-w>", group = "windows" },
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter" },
  { "mason-org/mason.nvim",           opts = {} },
  { "nvim-tree/nvim-web-devicons" },
  {
    "kawre/leetcode.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "tree-sitter/tree-sitter-html" },
    opts = {},
  },
  { "windwp/nvim-autopairs", opts = {} },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "cargo build --release",
    opts = { cmdline = { enabled = false } },
  },
  { "nvim-mini/mini.ai",     opts = {} },
})
