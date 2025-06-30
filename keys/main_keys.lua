local wezterm = require('wezterm')
local act = wezterm.action

return {
  -- Spawn panes and tabs
  { key = 's', mods = 'LEADER', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) }, -- Vertical Split
  { key = 'd', mods = 'LEADER', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) }, -- Horizontal split
  { key = 't', mods = 'LEADER', action = act.SpawnTab('CurrentPaneDomain') },

  -- Close panes and tabs
  { key = 'q', mods = 'LEADER', action = act.CloseCurrentPane({ confirm = false }) },
  { key = 'Q', mods = 'LEADER|SHIFT', action = act.CloseCurrentTab({ confirm = false }) },

  -- Scroll pane
  { key = 'k', mods = 'LEADER', action = act.ScrollByPage(-1) },
  { key = 'j', mods = 'LEADER', action = act.ScrollByPage(1) },

  -- Toggle pane zoom
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },

  -- Command palette
  { key = 'p', mods = 'LEADER', action = act.ActivateCommandPalette },

  -- Copy, Search and Quick select modes
  { key = 'x', mods = 'LEADER', action = act.ActivateCopyMode },
  { key = 'f', mods = 'LEADER', action = act.Search('CurrentSelectionOrEmptyString') },
  { key = 'g', mods = 'LEADER', action = act.QuickSelect },

  -- Change pane size
  { key = 'H', mods = 'ALT|CTRL|SHIFT', action = act.AdjustPaneSize({ 'Left', 1 }) },
  { key = 'J', mods = 'ALT|CTRL|SHIFT', action = act.AdjustPaneSize({ 'Down', 1 }) },
  { key = 'K', mods = 'ALT|CTRL|SHIFT', action = act.AdjustPaneSize({ 'Up', 1 }) },
  { key = 'L', mods = 'ALT|CTRL|SHIFT', action = act.AdjustPaneSize({ 'Right', 1 }) },

  -- Move from one pane and tab to another and swap tab positions
  { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection('Left') },
  { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection('Down') },
  { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection('Up') },
  { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection('Right') },
  { key = 'L', mods = 'ALT|SHIFT', action = act.ActivateTabRelative(1) },
  { key = 'H', mods = 'ALT|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'c', mods = 'LEADER', action = act.PaneSelect({ mode = 'SwapWithActive' }) },

  -- Goto tab
  { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
  { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
  { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
  { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
  { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
  { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
  { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },
  { key = '0', mods = 'LEADER', action = act.ActivateTab(9) },

  -- Change tab order
  { key = 'l', mods = 'LEADER', action = act.MoveTabRelative(1) },
  { key = 'h', mods = 'LEADER', action = act.MoveTabRelative(-1) },

  -- Copy and paste
  { key = 'C', mods = 'CTRL|SHIFT', action = act({ CopyTo = 'ClipboardAndPrimarySelection' }) },
  { key = 'V', mods = 'CTRL|SHIFT', action = act({ PasteFrom = 'Clipboard' }) },

  -- Font size controls
  { key = '=', mods = 'CTRL', action = 'IncreaseFontSize' },
  { key = '-', mods = 'CTRL', action = 'DecreaseFontSize' },
  { key = '0', mods = 'CTRL', action = 'ResetFontSize' },

  -- Toggle fullScreen
  { key = 'F11', mods = 'NONE', action = 'ToggleFullScreen' },
}
