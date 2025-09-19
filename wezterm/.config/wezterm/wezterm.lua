local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font settings
config.font_size = 18
config.line_height = 1.2
config.font = wezterm.font("MesloLGS Nerd Font")
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}
-- Appearance
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBar"
config.enable_tab_bar = false
config.color_scheme = "Gruvbox Dark (Gogh)"

-- Behaviour
config.automatically_reload_config = true
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"

return config
