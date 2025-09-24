---@type vim.lsp.Config
return {
  cmd = { "yaml-language-server", "--stdio" },
  settings = {
    yaml = {
      schemas = {
        -- ["https://raw.githubusercontent.com/awslabs/goformation/master/schema/buildspec.schema.json"] = "buildspec*.y*ml",
      },
    },
  },
}
