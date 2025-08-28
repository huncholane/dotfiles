local mpairs = require("mini.pairs")

--- Applies a function to a filetype
--- @param filetype string The filetype to apply to
--- @param f fun() The function to apply
local function apply_to_filetype(filetype, f)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = f,
  })

  -- Also run immediately if current buffer already matches
  if vim.bo.filetype == filetype then
    f()
  end
end

--- @type LazySpec
return {
  "echasnovski/mini.pairs",
  opts = function(_, _)
    apply_to_filetype("rust", function()
      mpairs.unmap("i", "'", "'")
    end)
  end,
}
