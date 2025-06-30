local function gruv(config)
  config.inactive_pane_hsb = {
    saturation = 0.5,
    brightness = 0.5,
  }

  return {
    ansi = {
      '#282828',
      '#cc241d',
      '#98971a',
      '#d79921',
      '#458588',
      '#b16286',
      '#689d6a',
      '#a89984',
    },
    brights = {
      '#928374',
      '#fb4934',
      '#b8bb26',
      '#fabd2f',
      '#83a598',
      '#d3869b',
      '#8ec07c',
      '#ebdbb2',
    },
    foreground = '#ebdbb2',
    background = '#1d2122',

    cursor_bg = '#77dd77',
    cursor_fg = '#1d2122',
    cursor_border = '#ebdbb2',
    compose_cursor = '#fe8019',

    selection_fg = '#1d2122',
    selection_bg = '#fb4934',

    split = '#fb4934',
    scrollbar_thumb = '#fabd2f',

    copy_mode_inactive_highlight_fg = { Color = '#1d2122' },
    copy_mode_inactive_highlight_bg = { Color = '#689d6a' },

    quick_select_label_fg = { Color = '#1d2122' },
    quick_select_label_bg = { Color = '#fb4934' },
    quick_select_match_fg = { Color = '#1d2122' },
    quick_select_match_bg = { Color = '#928374' },

    -- copy_mode_active_highlight_fg = { Color = '#' },
    -- copy_mode_active_highlight_bg = { Color = '#' },
    -- indexed = { [136] = '#' },
    -- input_selector_label_fg = { Color = '#' },
    -- input_selector_label_bg = { Color = '#' },
    -- launcher_label_fg = { Color = '#' },
    -- launcher_label_bg = { Color = '#' },

    tab_bar = {
      background = '#282828',

      active_tab = {
        bg_color = '#ebdbb2',
        fg_color = '#1d2122',
        intensity = 'Bold',
        italic = false,
        underline = 'None',
        strikethrough = false,
      },

      inactive_tab = {
        bg_color = '#928374',
        fg_color = '#fabd2f',
        intensity = 'Normal',
        italic = true,
        underline = 'None',
        strikethrough = false,
      },

      inactive_tab_hover = {
        bg_color = '#8ec07c',
        fg_color = '#1d2122',
        intensity = 'Normal',
        italic = true,
        underline = 'None',
        strikethrough = false,
      },

      new_tab = {
        bg_color = '#b8bb26',
        fg_color = '#1d2122',
        intensity = 'Normal',
        italic = true,
        underline = 'None',
        strikethrough = false,
      },

      new_tab_hover = {
        bg_color = '#d3869b',
        fg_color = '#1d2122',
        intensity = 'Normal',
        italic = true,
        underline = 'None',
        strikethrough = false,
      },
    },
  }
end

return gruv
