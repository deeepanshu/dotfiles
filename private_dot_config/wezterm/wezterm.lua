local wezterm = require("wezterm")
local config = {}
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.color_scheme = "Catppuccin Macchiato"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16.0
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.native_macos_fullscreen_mode = true
config.automatically_reload_config = true
config.tab_max_width = 16

config.keys = {
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\n"),
	},
}

return config
