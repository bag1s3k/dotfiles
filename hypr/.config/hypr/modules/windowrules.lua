--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.layer_rule({
	name = "notification-animations",
	match = { namespace = "swaync-control-center" },
	animation = "slide top",
})

hl.window_rule({
	name = "float-nwg-look",
	match = { class = "^(nwg-look)$" },
	float = true,
	center = true,
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
})

hl.window_rule({
	name = "float-discord",
	match = { class = "discord" },
	float = true,
	center = true,
	size = { "monitor_w * 0.6", "monitor_h * 0.7" },
})

hl.window_rule({
	match = { class = "clipse" },
	float = true,
	center = true,
	size = { 800, 600 },
})

hl.window_rule({
	match = { class = "yazi" },
	float = true,
	center = true,
	size = { "monitor_w * 0.7", "monitor_h * 0.7" },
})

hl.on("window.open", function(w)
	if w.class ~= "org.mozilla.firefox" then
		return
	end
	if w.initial_title ~= "Mozilla Firefox" then
		return
	end

	local ff_windows = hl.get_windows({ class = "org.mozilla.firefox" })
	if #ff_windows <= 1 then
		return
	end

	hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))

	local sub
	sub = hl.on("window.title", function(tw)
		if tw.address ~= w.address then
			return
		end
		if
			tw.title == ""
			or tw.title == "Mozilla Firefox"
			or tw.title == "about:blank"
			or tw.title:match("^about:.*Mozilla Firefox$")
		then
			return
		end

		sub:remove()

		if tw.title:match("^Extension:") then
			hl.dispatch(hl.dsp.window.resize({ x = 800, y = 600, window = tw }))
			hl.dispatch(hl.dsp.window.center({ window = tw }))
			hl.dispatch(hl.dsp.focus({ window = tw }))
		else
			hl.dispatch(hl.dsp.window.float({ action = "unset", window = tw }))
		end
	end)
end)
