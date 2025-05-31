---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
      },
      servers = {
        lua_ls = {
          workspace = {
            library = {
              vim.fn.stdpath("data") .. "/lazy/LazyVim/lua/lazyvim/types.lua",
            },
          },
        },
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
