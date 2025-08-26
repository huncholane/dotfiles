return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- make sure you're on the current branch
    ft = { "rust" },
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            procMacro = {
              enable = true, -- <== this is the big one
            },
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    },
    config = function(_, opts)
      -- Pass settings into rustaceanvim
      vim.g.rustaceanvim = opts

      -- keymap to expand macros under cursor
      vim.keymap.set("n", "<leader>me", function()
        local params = vim.lsp.util.make_position_params(0, "utf-8")
        vim.lsp.buf_request(0, "experimental/expandMacro", params, function(_, result)
          if not result then
            return
          end
          local buf = vim.api.nvim_create_buf(false, true)
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(result.expansion, "\n"))
          vim.api.nvim_set_current_buf(buf)
        end)
      end, { desc = "Expand Rust macro" })
    end,
  },
}
