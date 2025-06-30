local wezterm = require('wezterm')
local config = wezterm.config_builder()

local main_keys = require('keys.main_keys')
local extra_keys = require('keys.extra_keys')
local gruvbox = require('colors.gruvbox_custom')(config)

-- Prog
-- config.default_prog = { 'bin', 'args' }

-- Graphics settings
config.enable_wayland = true
config.front_end = 'WebGpu'
config.webgpu_power_preference = 'HighPerformance'

-- Clear default bindings declare leader set main keys and extra keys
config.disable_default_key_bindings = true
config.leader = { key = 'a', mods = 'ALT', timeout_milliseconds = 1500 }
config.keys = main_keys
config.key_tables = extra_keys

-- Color settings
config.colors = gruvbox

-- Font settings
config.font = wezterm.font_with_fallback({ 'Iosevka Nerd Font', 'Jigmo', 'FiraCode Nerd Font' })
config.warn_about_missing_glyphs = false
config.font_size = 14

-- Cursor settings
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500

-- Tab settings
config.tab_max_width = 32
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Window settings
config.window_decorations = 'NONE'
config.window_background_opacity = 1.0
config.window_close_confirmation = 'NeverPrompt'

-- Misc settings
config.max_fps = 180
config.scrollback_lines = 5000
config.enable_kitty_keyboard = true
config.pane_focus_follows_mouse = true

-- Plugins
-- require('plugins.resurrect')(config)

return config
