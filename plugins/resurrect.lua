local wezterm = require('wezterm')

local function resu(config)
  local resurrect = wezterm.plugin.require('https://github.com/MLFlexer/resurrect.wezterm')

  local resu_keys = {
    {
      key = 'w',
      mods = 'ALT',
      action = wezterm.action_callback(function(win, pane)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      end),
    },
    {
      key = 'W',
      mods = 'ALT',
      action = resurrect.window_state.save_window_action(),
    },
    {
      key = 'T',
      mods = 'ALT',
      action = resurrect.tab_state.save_tab_action(),
    },
    {
      key = 's',
      mods = 'ALT',
      action = wezterm.action_callback(function(win, pane)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
        resurrect.window_state.save_window_action()
      end),
    },
    {
      key = 'r',
      mods = 'ALT',
      action = wezterm.action_callback(function(win, pane)
        resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
          local type = string.match(id, '^([^/]+)') -- match before '/'
          id = string.match(id, '([^/]+)$') -- match after '/'
          id = string.match(id, '(.+)%..+$') -- remove file extention
          local opts = {
            relative = true,
            restore_text = true,
            on_pane_restore = resurrect.tab_state.default_on_pane_restore,
          }
          if type == 'workspace' then
            local state = resurrect.state_manager.load_state(id, 'workspace')
            resurrect.workspace_state.restore_workspace(state, opts)
          elseif type == 'window' then
            local state = resurrect.state_manager.load_state(id, 'window')
            resurrect.window_state.restore_window(pane:window(), state, opts)
          elseif type == 'tab' then
            local state = resurrect.state_manager.load_state(id, 'tab')
            resurrect.tab_state.restore_tab(pane:tab(), state, opts)
          end
        end)
      end),
    },
  }

  for _, v in ipairs(resu_keys) do
    table.insert(config.keys, v)
  end

  resurrect.state_manager.periodic_save({
    -- interval_seconds = 15 * 60,
    interval_seconds = 15,
    save_workspaces = true,
    save_windows = true,
    save_tabs = true,
  })

  wezterm.on('gui-startup', resurrect.state_manager.resurrect_on_gui_startup)
end

return resu
