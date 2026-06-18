-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    --hl.exec_cmd("systemctl --user stop xdg-desktop-portal-gnome")
    --hl.exec_cmd("systemctl --user restart xdg-desktop-portal")
    --hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")

    hl.exec_cmd("swaybg -i ~/Pictures/wallpapers/dark-mountain.png -m fill")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
end)
