local wezterm = require("wezterm")
local utils = require("utils")
local act = wezterm.action
local config = wezterm.config_builder()
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

-- set up tabline
tabline.setup()
tabline.apply_to_config(config)

-- set up resurrect
wezterm.on("gui-startup", resurrect.state_manager.resurrect_on_gui_startup)
resurrect.state_manager.periodic_save()

-- window config
config.enable_wayland = false
config.font_size = 8
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.enable_scroll_bar = true
config.colors = {
  scrollbar_thumb = "orange",
}
config.color_scheme = "Tokyo Night Storm"

-- keymap
config.keys = {
  -- Vim like pane movement
  { key = "h", mods = "ALT",        action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "ALT",        action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "ALT",        action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "ALT",        action = act.ActivatePaneDirection("Right") },

  -- Vim like resize events
  { key = "h", mods = "SHIFT|ALT",  action = act.AdjustPaneSize({ "Left", 3 }) },
  { key = "j", mods = "SHIFT|ALT",  action = act.AdjustPaneSize({ "Down", 3 }) },
  { key = "k", mods = "SHIFT|ALT",  action = act.AdjustPaneSize({ "Up", 3 }) },
  { key = "l", mods = "SHIFT|ALT",  action = act.AdjustPaneSize({ "Right", 3 }) },

  -- Vim like create panes
  { key = "h", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Left" }) },
  { key = "j", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Down" }) },
  { key = "k", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Up" }) },
  { key = "l", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Right" }) },

  -- New tab in current pane's cwd
  { key = "t", mods = "SHIFT|ALT",  action = act.SpawnTab("CurrentPaneDomain") },

  -- Close current pane
  { key = "q", mods = "ALT",        action = act.CloseCurrentPane({ confirm = true }) },

  -- open lazygit
  {
    key = "g",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(win, pane)
      win:perform_action(act.SplitPane({ direction = "Right", command = { args = { "lazygit" } } }), pane)
      win:perform_action(act.TogglePaneZoomState, pane)
    end),
  },

  -- workspace switcher
    {
    key = "p",
    mods = "ALT",
    action = workspace_switcher.switch_to_prev_workspace(),
  },

  -- resurrect bindings
  {
    key = "w",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
    end),
  },
  {
    key = "W",
    mods = "ALT",
    action = resurrect.window_state.save_window_action(),
  },
  {
    key = "T",
    mods = "ALT",
    action = resurrect.tab_state.save_tab_action(),
  },
  {
    key = "s",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      resurrect.window_state.save_window_action()
    end),
  },
  {
    key = "r",
    mods = "ALT",
    action = wezterm.action_callback(function(win, pane)
      resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
        local type = string.match(id, "^([^/]+)") -- match before '/'
        id = string.match(id, "([^/]+)$")     -- match after '/'
        id = string.match(id, "(.+)%..+$")    -- remove file extention
        local opts = {
          relative = true,
          restore_text = true,
          on_pane_restore = resurrect.tab_state.default_on_pane_restore,
        }
        if type == "workspace" then
          local state = resurrect.state_manager.load_state(id, "workspace")
          resurrect.workspace_state.restore_workspace(state, opts)
        elseif type == "window" then
          local state = resurrect.state_manager.load_state(id, "window")
          resurrect.window_state.restore_window(pane:window(), state, opts)
        elseif type == "tab" then
          local state = resurrect.state_manager.load_state(id, "tab")
          resurrect.tab_state.restore_tab(pane:tab(), state, opts)
        end
      end)
    end),
  },
}

return config
