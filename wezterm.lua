local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'GruvboxDark'
config.font = wezterm.font_with_fallback {
    { family = 'JetBrains Mono', harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, },
    'Consolas',
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingBlock"
config.font_size = 14
config.line_height = 1
config.window_background_opacity = 1
config.term = "wezterm"
config.selection_word_boundary = " \n\t{}[]()\"'`,;:"

return config
