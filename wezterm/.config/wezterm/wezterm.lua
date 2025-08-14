local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font settings
config.font_size = 18
config.line_height = 1.2 
config.font = wezterm.font("GeistMono Nerd Font Mono", { weight = "Bold" })
-- config.font = wezterm.font("SFMono Nerd Font", { weight = "Medium" })
-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Medium" })
config.colors = {
  cursor_bg = "white",
  cursor_border = "white",
}
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Tokyo Night"

-- Appearance
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.7
-- config.macos_window_background_blur = 24
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 24,
  right = 24,
  top = 12,
  bottom = 12,
}
config.default_cursor_style = "BlinkingBar"

-- Behaviour
config.automatically_reload_config = true
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"

return config
