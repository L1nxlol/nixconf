if hl.plugin.hyprglass then
    local hg = hl.plugin.hyprglass

    hg.config({
        default_theme = "dark",
        default_preset = "frosted",
        tint_color = 0x8899aa22,
    })


    hg.preset("frosted", {
      inherits = "glass",

      blur_strength = 3,
      blur_iterations = 3,

      brightness = 0.7,
    })

    hg.preset("dimmed", {
      inherits = "frosted",


      brightness = 0.2,
      fresnel_strength = 0,
    })

end
