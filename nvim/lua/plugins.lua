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
          require("null-ls.builtins.diagnostics.hadolint")
        },
      })
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>-",
        mode = { "n", "v" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>e",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
    { "j-hui/fidget.nvim" }
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
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "json", "python", "rust", "typescript", "markdown", "bash" },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {}
      })
    end
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  { "nvim-tree/nvim-web-devicons" },
  {
    "kawre/leetcode.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "tree-sitter/tree-sitter-html" },
    opts = {},
  },
  { "windwp/nvim-autopairs",      opts = {} },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "cargo build --release",
    opts = { cmdline = { enabled = false } },
  },
  { "nvim-mini/mini.ai", opts = {} },
})
