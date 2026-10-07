---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "cz",
		kb_variant = "",
		kb_model = "",
		kb_options = "caps:swapescape",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "asuf1208:00-2808:0218-touchpad",
	sensitivity = 0,
	natural_scroll = true,
	scroll_factor = 0.15,
})

hl.device({
	name = "logitech-pro-x-1",
	sensitivity = -0.5,
	scroll_factor = 1,
})
