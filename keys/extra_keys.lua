local wezterm = require('wezterm')
local act = wezterm.action

return {
  copy_mode = {
    -- Move forward end and backward word
    { key = 'w', mods = 'NONE', action = act.CopyMode('MoveForwardWord') },
    { key = 'e', mods = 'NONE', action = act.CopyMode('MoveForwardWordEnd') },
    { key = 'b', mods = 'NONE', action = act.CopyMode('MoveBackwardWord') },

    -- Move left down up and right
    { key = 'h', mods = 'NONE', action = act.CopyMode('MoveLeft') },
    { key = 'j', mods = 'NONE', action = act.CopyMode('MoveDown') },
    { key = 'k', mods = 'NONE', action = act.CopyMode('MoveUp') },
    { key = 'l', mods = 'NONE', action = act.CopyMode('MoveRight') },

    -- Move start of content end of line content start and start of next line
    { key = '^', mods = 'NONE', action = act.CopyMode('MoveToStartOfLineContent') },
    { key = '$', mods = 'NONE', action = act.CopyMode('MoveToEndOfLineContent') },
    { key = '0', mods = 'NONE', action = act.CopyMode('MoveToStartOfLine') },
    { key = 'Enter', mods = 'NONE', action = act.CopyMode('MoveToStartOfNextLine') },

    -- Move top and bottom
    { key = 'g', mods = 'NONE', action = act.CopyMode('MoveToScrollbackTop') },
    { key = 'G', mods = 'NONE', action = act.CopyMode('MoveToScrollbackBottom') },

    -- Move to viewport top bottom and middle
    { key = 'H', mods = 'NONE', action = act.CopyMode('MoveToViewportTop') },
    { key = 'L', mods = 'NONE', action = act.CopyMode('MoveToViewportBottom') },
    { key = 'M', mods = 'NONE', action = act.CopyMode('MoveToViewportMiddle') },

    -- Move to selection other end and other end horizontal
    { key = 'o', mods = 'NONE', action = act.CopyMode('MoveToSelectionOtherEnd') },
    { key = 'O', mods = 'SHIFT', action = act.CopyMode('MoveToSelectionOtherEndHoriz') },

    -- Move full page up down and half-page up down
    { key = 'f', mods = 'CTRL', action = act.CopyMode('PageDown') },
    { key = 'b', mods = 'CTRL', action = act.CopyMode('PageUp') },
    { key = 'd', mods = 'CTRL', action = act.CopyMode({ MoveByPage = 0.5 }) },
    { key = 'u', mods = 'CTRL', action = act.CopyMode({ MoveByPage = -0.5 }) },

    -- Selection mode cell line and block
    { key = 'v', mods = 'NONE', action = act.CopyMode({ SetSelectionMode = 'Cell' }) },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode({ SetSelectionMode = 'Line' }) },
    { key = 'v', mods = 'CTRL', action = act.CopyMode({ SetSelectionMode = 'Block' }) },

    -- Copy mode Close
    { key = 'q', mods = 'NONE', action = act.Multiple({ 'ScrollToBottom', { CopyMode = 'Close' } }) },
    { key = 'Escape', mods = 'NONE', action = act.Multiple({ 'ScrollToBottom', { CopyMode = 'Close' } }) },

    -- Clear search and clear selection highlights
    { key = 'Backspace', mods = 'CTRL', action = act.CopyMode('ClearPattern') },
    { key = 'Backspace', mods = 'CTRL|SHIFT', action = act.CopyMode('ClearSelectionMode') },

    -- Yank and exit
    {
      key = 'y',
      mods = 'NONE',
      action = act.Multiple({
        { CopyTo = 'ClipboardAndPrimarySelection' },
        { Multiple = { 'ScrollToBottom', { CopyMode = 'Close' } } },
      }),
    },
  },

  search_mode = {
    -- Next and prev match
    { key = 'n', mods = 'CTRL', action = act.CopyMode('NextMatch') },
    { key = 'p', mods = 'CTRL', action = act.CopyMode('PriorMatch') },

    -- Change search mode
    { key = 'm', mods = 'CTRL', action = act.CopyMode('CycleMatchType') },

    -- Clear search
    { key = 'Backspace', mods = 'CTRL', action = act.CopyMode('ClearPattern') },

    -- Close Copy mode
    { key = 'Escape', mods = 'NONE', action = act.CopyMode('Close') },
  },
}
