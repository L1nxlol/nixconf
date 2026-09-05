exec_once = {
  'dconf write /org/gnome/desktop/interface/color-scheme "prefer-dark"'
}



hl.on("hyprland.start", function ()
  hl.exec_cmd("dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("awww-daemon")
  -- hl.exec_cmd("hyprctl setcursor 'Vimix Cursors' 14")
  -- hl.exec_cmd("hyprctl setcursor 'AOSP Cursors' 14")
  hl.exec_cmd("systemctl --user start blueman-applet")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("swaync")
  hl.exec_cmd("qs -p ~/Nix/home/quickshell/shell.qml")
end)



env = {
  { "GTK_THEME", "Adwaita:dark" },
  { "GTK_APPLICATION_PREFER_DARK_THEME", "1" },
  { "QT_QPA_PLATFORMTHEME", "qt6ct" },
}

-- hl.env("XCURSOR_THEME", "AOSP Cursors")
hl.env("XCURSOR_THEME", "Vimix cursors")
hl.env("XCURSOR_SIZE", "14")
