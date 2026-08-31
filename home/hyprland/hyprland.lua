hl.monitor({
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "1920x0",
    scale    = "auto",
})

hl.monitor({
    output   = "HDMI-A-2",
    mode     = "preferred",
    position = "0x0",
    scale    = "auto",
})

hl.workspace_rule({ workspace = "special:secondary", monitor = "HDMI-A-1" })


hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


hl.config({
  input = {
    kb_layout  = "us",
    kb_variant = "",
    kb_model   = "",
    kb_options = "",
    kb_rules   = "",

    follow_mouse = 1,
    sensitivity = 0,

    touchpad = {
      natural_scroll = false,
    },
  },
  binds = {},
})



hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

suppressMaximizeRule:set_enabled(true)


hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})



hl.config({
  ecosystem = {
    no_donation_nag = true,
    no_update_news = true,
  },
})



hl.plugin.load("/home/user/Nix/home/hyprland/plugins/hyprglass.so")



require("autostart")
require("gestures")
require("style")
require("animations")
require("binds")
require("layout")
require("rules")
require("hyprglass")
