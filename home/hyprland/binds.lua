mainMod = "SUPER"
hl = hl

local dirKeys = {
  ["W"] = "up",
  ["up"] = "up",
  ["S"] = "down",
  ["down"] = "down",
  ["A"] = "left",
  ["left"] = "left",
  ["D"] = "right",
  ["right"] = "right",
}


for i = 1, 10 do
  if i == 10 then key = 0 else key = i end
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1", default = true })
    hl.bind("SUPER + ".. key, hl.dsp.focus({workspace = i}))
    hl.bind("SUPER + SHIFT + ".. key, hl.dsp.window.move({workspace = i}))
    hl.bind("SUPER + CTRL + ".. key, hl.dsp.window.move({workspace = i, follow = false}))
end

for i = 11, 20 do
  if i == 20 then key = 0 else key = i - 10 end
  hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-2", default = true })
  hl.bind("SUPER + ALT + ".. key, hl.dsp.focus({workspace = i}))
  hl.bind("SUPER + ALT + SHIFT + ".. key, hl.dsp.window.move({workspace = i}))
  hl.bind("SUPER + ALT + CTRL + ".. key, hl.dsp.window.move({workspace = i, follow = false}))
end

for key, dir in pairs(dirKeys) do
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({direction = dir}))
  hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.swap({direction = dir}))
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({direction = dir}))
end

hl.bind("SUPER + E", hl.dsp.focus({workspace = "e+1"}))
hl.bind("SUPER + Q", hl.dsp.focus({workspace = "e-1"}))


hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- SHORTCUT KEYBINDS
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("kitty --class kitty-float -e zsh -lc 'btop; exec zsh'"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("zen"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("tor-browser"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obs"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("localsend_app"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("eog"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("totem"))


-- SYSTEM KEYBINDS
hl.bind("ALT + space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"'))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim "$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"'))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("qs -p /home/user/Nix/home/quickshell/ ipc call screen-lock lock"))


-- WINDOW MANAGEMENT
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.float())

hl.bind(mainMod .. " + Tab",         hl.dsp.workspace.toggle_special("tab"))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.move({ workspace = "special:tab" }))


-- PLAYERCTL
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


-- F KEYS
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })


-- CAPSLOCK
hl.bind(" + code:66", function()
  local activeWindow = hl.get_active_window()
  local terminals = {
    ["kitty"] = true,
    ["com.mitchellh.ghostty"] = true,
    ["org.wezfurlong.wezterm"] = true,
    ["md.Obsidian"] = true,
  }

  if activeWindow ~= nil and terminals[activeWindow.class] then
    hl.dispatch(hl.dsp.send_shortcut({ mods = "", key = "Escape" }))
  else
    hl.dispatch(hl.dsp.send_shortcut({ mods = "", key = "code:66" }))
  end
end)

hl.config({
  input = {
    kb_options = "caps:none",
  },
})
