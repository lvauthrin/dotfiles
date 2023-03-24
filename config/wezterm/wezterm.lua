local wezterm = require("wezterm")
local act = wezterm.action

local config = {
	color_scheme = "Srcery (Gogh)",
	--color_scheme = "Catppuccin Frappe",
	font = wezterm.font_with_fallback({
		"SauceCodePro Nerd Font Mono",
	}),

	keys = {
		{
			key = "h",
			mods = "CMD|SHIFT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CMD|SHIFT",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CMD|SHIFT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CMD|SHIFT",
			action = act.ActivatePaneDirection("Down"),
		},
	},
}

return config
