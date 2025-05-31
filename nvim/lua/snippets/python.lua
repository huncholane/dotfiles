local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Utility to insert import if not present
---@param import_string string # The import string
local function insert_import(import_string)
  local cur = vim.api.nvim_win_get_cursor(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for _, line in ipairs(lines) do
    if line == import_string then
      return {} -- already imported
    end
  end
  -- Insert at top
  table.insert(lines, 1, import_string)
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.schedule(function()
    vim.api.nvim_win_set_cursor(0, { cur[1] + 1, cur[2] })
  end)
  return {}
end

local function insert_dt_import()
  insert_import("import datetime as dt")
end

local function insert_pd_import()
  insert_import("import pandas as pd")
end

local function insert_np_import()
  insert_import("import numpy as np")
end

return {
  -- Simple triple-quote docstring
  s("ds", {
    t({ '"""' }),
    i(1, "Summary."),
    t({ '"""' }),
  }),
  s("dt", f(insert_dt_import)),
  s("pd", f(insert_pd_import)),
  s("np", f(insert_np_import)),
  s("urlpatterns", {
    t({ "urlpatterns = [", "\t" }),
    i(1, "path(...)"),
    t({ "", "]" }),
  }),
}
