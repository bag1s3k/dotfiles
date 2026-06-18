------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
hl.monitor({
    --output   = "eDP-1", -- integraded monitor
    output = "desc:BOE NE140QDM-NX7",
    disabled = true,
    mode     = "2560x1600@60.001999",
    position = "auto",
    scale = "1.25",
})
hl.monitor({
	--output = "DP-12", -- Gigabyte
	output = "desc:GIGA-BYTE TECHNOLOGY CO. LTD. M27QA FA3T01940000",
	mode = "2560x1440@180",
	position = "1440x0",
	scale = "1",
})
hl.monitor({
	--output = "DP-9", -- Dell right
	output = "desc:Dell Inc. DELL S2721DS H720R43",
	mode = "2560x1440@59.95",
	position = "4000x0",
	scale = "1",
})
hl.monitor({
	--output = "DP-10", -- Dell left
	output = "desc:Dell Inc. DELL S2721DS 5P92VY3",
	mode = "2560x1440@59.95",
	position = "0x-150",
	scale = "1",
	transform = 3
})

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
