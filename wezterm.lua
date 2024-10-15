local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'GruvboxDark'
config.font = wezterm.font_with_fallback {
    { family = 'JetBrains Mono', harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, },
    'Consolas',
}
config.font_rules = {
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font_with_fallback {
        { family = 'Jetbrains Mono', weight = 'ExtraBlack' },
    },
  },
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingBlock"
config.font_size = 14
config.line_height = 1
config.window_background_opacity = 1
config.term = "xterm-256color"
config.selection_word_boundary = " \n\t{}[]()\"'`,;:"

local act = wezterm.action

-- from https://github.com/wez/wezterm/issues/522#issuecomment-1496894508
config.keys = {
  {
    key = 'E',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

return config
