local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

local config = {
	color_scheme = "Srcery (Gogh)",
	--color_scheme = "Catppuccin Frappe",
	font = wezterm.font_with_fallback({
		"SauceCodePro Nerd Font Mono",
	}),
	window_background_opacity = 0.95,
	macos_window_background_blur = 20,
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

wezterm.on("gui-startup", function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then
		args = cmd.args
	end

	-- Set a workspace for coding on a current project
	-- Top pane is for the editor, bottom pane is for the build tool
	local dotfiles_dir = wezterm.home_dir .. "/code/.dotfiles"

	local tab, build_pane, window = mux.spawn_window({
		workspace = "coding",
		cwd = dotfiles_dir,
		args = args,
	})

	local editor_pane = build_pane:split({
		direction = "Top",
		size = 0.75,
		cwd = dotfiles_dir,
	})

	-- may as well kick off a build in that pane
	editor_pane:send_text("z .dotfiles\n")
	editor_pane:send_text("nvim .\n")
	build_pane:send_text("z .dotfiles\n")

	-- A workspace for interacting with a local machine that
	-- runs some docker containners for home automation
	--local tab, pane, window = mux.spawn_window({
	--	workspace = "leetcode",
	--	args = { "z", "leetcode" },
	--})

	leetcode_dir = wezterm.home_dir .. "/code/leetcode"

	local leet_tab, leet_build_pane = window:spawn_tab({
		cwd = leetcode_dir,
	})

	--local leet_tab, leet_build_pane, leet_window = mux.spawn_window({
	--	workspace = "leetcode",
	--	cwd = leetcode_dir,
	--	args = args,
	--})

	local leet_editor_pane = leet_build_pane:split({
		direction = "Top",
		size = 0.75,
		cwd = leetcode_dir,
	})

	leet_editor_pane:send_text("z leetcode\n")
	leet_editor_pane:send_text("nvim .\n")
	-- We want to startup in the coding workspace
	mux.set_active_workspace("coding")
end)

return config
