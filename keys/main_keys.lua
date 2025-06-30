local wezterm = require('wezterm')
local act = wezterm.action
local mux = wezterm.mux

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
  { key = 'c', mods = 'LEADER', action = act.PaneSelect({ mode = 'SwapWithActiveKeepFocus' }) },

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

  -- Rename tab
  {
    key = 'r',
    mods = 'LEADER',
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { Color = '#fb4934' } },
        { Text = 'Enter new name for tab' },
      }),
      initial_value = '',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },

  {
    key = 'N',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { Color = '#fb4934' } },
        { Text = 'Enter name for new workspace' },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace({
              name = line,
            }),
            pane
          )
        end
      end),
    }),
  },

  -- from blog. rename workspace
  {
    key = '$',
    mods = 'LEADER|SHIFT',
    action = act.PromptInputLine({
      description = 'Enter new name for session',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          mux.rename_workspace(window:mux_window():get_workspace(), line)
        end
      end),
    }),
  },

  -- from wezterm conf. Show workspaces
  {
    key = '9',
    mods = 'ALT',
    action = act.ShowLauncherArgs({
      flags = 'FUZZY|WORKSPACES',
    }),
  },

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
