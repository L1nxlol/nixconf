local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 11
config.window_background_opacity = 0.6
config.window_padding = {
  left = 10, right = 10, top = 10, bottom = 10,
}
config.window_decorations = "NONE"
config.window_close_confirmation = "NeverPrompt"

config.font = wezterm.font_with_fallback({
  { family = 'Symbols Nerd Font Mono', scale = 1.2 },
  { family = 'GeistMono Nerd Font Mono' },
})

return config
