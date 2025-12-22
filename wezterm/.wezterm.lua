local wezterm = require 'wezterm'

local action = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night'

config.font = wezterm.font {
  family = 'JetBrains Mono',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}

config.enable_tab_bar = true

config.window_decorations = 'RESIZE'

config.window_close_confirmation = 'NeverPrompt'

config.hide_tab_bar_if_only_one_tab = false

config.use_fancy_tab_bar = false

config.tab_and_split_indices_are_zero_based = true

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 10000 }

config.keys = {
  {
    mods = "LEADER",
    key = "c",
    action = action.SpawnTab("CurrentPaneDomain"),
  },
  {
    mods = "LEADER",
    key = "x",
    action = action.CloseCurrentPane({ confirm = true }),
  },
  {
    mods = "LEADER",
    key = "v",
    action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "LEADER",
    key = "s",
    action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    mods = "CTRL",
    key = "h",
    action = action.ActivatePaneDirection("Left"),
  },
  {
    mods = "CTRL",
    key = "j",
    action = action.ActivatePaneDirection("Down"),
  },
  {
    mods = "CTRL",
    key = "k",
    action = action.ActivatePaneDirection("Up"),
  },
  {
    mods = "CTRL",
    key = "l",
    action = action.ActivatePaneDirection("Right"),
  },
  {
    mods = "LEADER",
    key = "LeftArrow",
    action = action.AdjustPaneSize({ "Left", 5 }),
  },
  {
    mods = "LEADER",
    key = "RightArrow",
    action = action.AdjustPaneSize({ "Right", 5 }),
  },
  {
    mods = "LEADER",
    key = "DownArrow",
    action = action.AdjustPaneSize({ "Down", 5 }),
  },
  {
    mods = "LEADER",
    key = "UpArrow",
    action = action.AdjustPaneSize({ "Up", 5 }),
  },
}

return config
