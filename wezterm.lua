local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Andromeda"
config.font = wezterm.font({
	family = "NotoSansM Nerd Font",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})
config.font_size = 10

config.initial_cols = 80
config.initial_rows = 24

config.hide_tab_bar_if_only_one_tab = true

return config
