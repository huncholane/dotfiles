require("lazy.types")
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
      },
      servers = {
        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "workspace",
                exclude = { "**/__pycache__", "**/node_modules", "**/venv", "**/.mypycache", "**/site-packages" },
                ignore = { "**/site-packages/**" },
                logLevel = "Error",
                useLibraryCodeForTypes = false,
              },
            },
            python = {},
          },
        },
        pyright = {
          enabled = false,
          settings = {
            python = {
              analysis = {},
            },
          },
        },
        sourcekit = {
          enabled = true,
          cmd = { "sourcekit-lsp" },
          filetypes = { "swift" },
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
  },
}
