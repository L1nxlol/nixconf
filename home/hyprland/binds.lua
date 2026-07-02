mainMod = "SUPER"

local dirKeys = {
  ["W"] = "up",
  ["up"] = "right",
  ["S"] = "down",
  ["down"] = "down",
  ["A"] = "left",
  ["left"] = "left",
  ["D"] = "right",
  ["right"] = "right",
}


for i = 1, 10 do 
  if i == 10 then key = 0 else key = i end
  hl.bind("SUPER + ".. key, hl.dsp.focus({workspace = i}))
  hl.bind("SUPER + SHIFT + ".. key, hl.dsp.window.move({workspace = i}))
  hl.bind("SUPER + CTRL + ".. key, hl.dsp.window.move({workspace = i, follow = false}))
end

for key, dir in pairs(dirKeys) do 
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({direction = dir}))
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({direction = dir}))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })




-- main keybinds
hl.bind("ALT + space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("zen"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("~/Nix/scripts/power"))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"'))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim "$HOME/Pictures/Screenshots/$(date +%F_%H-%M-%S).png"'))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
-- hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(terminal))




-- window management
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + B", hl.dsp.window.float())


hl.bind(mainMod .. " + Tab",         hl.dsp.workspace.toggle_special("tab"))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.move({ workspace = "special:tab" }))




-- playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- laptop 
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

