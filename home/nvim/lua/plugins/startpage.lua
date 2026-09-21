return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      "                                                                   ",
      "  ███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄  ",
      "  ███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄",
      "  ███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███",
      "  ███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███",
      "  ███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███",
      "  ███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███",
      "  ███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███",
      "   ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀ ",
      "                                                                   ",
      "                                                                   ",
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<Cmd>ene<CR>"),
      dashboard.button("f", "  Find file", "<Cmd>Telescope find_files<CR>"),
      dashboard.button("h", "  Hidden files", "<Cmd>Telescope find_files hidden=true<CR>"),
      dashboard.button("r", "  Recent file", "<Cmd>Telescope oldfiles<CR>"),
      dashboard.button("p", "  Lazy", "<Cmd>Lazy<CR>"),
      dashboard.button("n", "  Nix", ":e/home/user/Nix/<CR>"),
      dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
    }
    require("alpha").setup(dashboard.opts)
  end,
}
