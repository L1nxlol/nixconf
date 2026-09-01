hl.layer_rule({ -- slurp trailing animation fix  
    match = { namespace = "^(selection)$" },
    no_anim = true,
})

hl.window_rule({
    match = { class = "^(kitty-float)$" },
    float = true,
    size = { 700, 450 },
    center = true,
})

hl.window_rule({
  match = { class = "md.Obsidian" },
  tag = "+hyprglass_preset_dimmed"
})
