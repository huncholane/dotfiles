vim.cmd([[
comp rust_verbose
]])
require("nvim-autopairs").remove_rule("`")
require("nvim-autopairs").remove_rule("'")
