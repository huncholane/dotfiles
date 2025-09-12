local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function project_folders_picker(opts)
	opts = opts or {}
	local dirs = vim.fn.systemlist("fd -t d -H -E .git")
	if #dirs == 0 then
		vim.notify("No directories found", vim.log.levels.WARN)
		return
	end

	pickers
		.new(opts, {
			prompt_title = "Project Folders",
			finder = finders.new_table(dirs),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if selection then
						vim.cmd("Oil " .. selection[1])
					end
				end)
				return true
			end,
		})
		:find()
end

return require("telescope").register_extension({
	exports = {
		oil = project_folders_picker,
	},
})
