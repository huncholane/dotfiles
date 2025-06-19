local function has_flag(flag)
  for _, arg in ipairs(vim.v.argv) do
    if arg == flag then
      return true
    end
  end
  return false
end

if has_flag("-R") then
  require("config.vr")
else
  require("config.lazy")
end
