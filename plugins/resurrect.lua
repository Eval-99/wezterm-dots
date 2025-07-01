local wezterm = require('wezterm')

local function resu(config)
  local resurrect = wezterm.plugin.require('https://github.com/MLFlexer/resurrect.wezterm')

  local resu_keys = {
    -- Load state
    {
      key = 'W',
      mods = 'LEADER|SHIFT',
      action = wezterm.action_callback(function(win, pane)
        resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id, label)
          local type = string.match(id, '^([^/]+)') -- match before '/'
          id = string.match(id, '([^/]+)$') -- match after '/'
          id = string.match(id, '(.+)%..+$') -- remove file extention
          local opts = {
            close_open_tabs = true,
            window = pane:window(),
            on_pane_restore = resurrect.tab_state.default_on_pane_restore,
            relative = true,
            restore_text = true,
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

    -- Save state
    {
      key = 'S',
      mods = 'LEADER|SHIFT',
      action = wezterm.action_callback(function(win, pane)
        resurrect.state_manager.save_state(resurrect.workspace_state.get_workspace_state())
      end),
    },

    -- Delete state
    {
      key = 'D',
      mods = 'LEADER|SHIFT',
      action = wezterm.action_callback(function(win, pane)
        resurrect.fuzzy_loader.fuzzy_load(win, pane, function(id)
          resurrect.state_manager.delete_state(id)
        end, {
          title = 'Delete State',
          description = 'Select State to Delete and press Enter = accept, Esc = cancel, / = filter',
          fuzzy_description = 'Search State to Delete: ',
          is_fuzzy = true,
        })
      end),
    },
  }

  for _, v in ipairs(resu_keys) do
    table.insert(config.keys, v)
  end

  resurrect.state_manager.periodic_save({
    interval_seconds = 60,
    save_workspaces = true,
    save_windows = true,
    save_tabs = true,
  })

  resurrect.state_manager.set_max_nlines(5000)
  wezterm.on('gui-startup', resurrect.state_manager.resurrect_on_gui_startup)

  -- Manually set state save location (Microsoft Windows)
  -- resurrect.state_manager.change_state_save_dir('C:\\Users\\<user>\\Desktop\\state\\')

  -- Send toast notification on manual save
  -- local resurrect_event_listeners = {
  --   'resurrect.error',
  --   'resurrect.state_manager.save_state.finished',
  -- }
  -- local is_periodic_save = false
  -- wezterm.on('resurrect.periodic_save', function()
  --   is_periodic_save = true
  -- end)
  -- for _, event in ipairs(resurrect_event_listeners) do
  --   wezterm.on(event, function(...)
  --     if event == 'resurrect.state_manager.save_state.finished' and is_periodic_save then
  --       is_periodic_save = false
  --       return
  --     end
  --     local args = { ... }
  --     local msg = event
  --     for _, v in ipairs(args) do
  --       msg = msg .. ' ' .. tostring(v)
  --     end
  --     wezterm.gui.gui_windows()[1]:toast_notification('Wezterm - resurrect', msg, nil, 4000)
  --   end)
  -- end
end

return resu
