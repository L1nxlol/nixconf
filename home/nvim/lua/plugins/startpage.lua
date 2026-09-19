return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      "your ascii art here",
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<Cmd>ene<CR>"),
      dashboard.button("f", "  Find file", "<Cmd>Telescope find_files<CR>"),
      dashboard.button("q", "  Quit", "<Cmd>qa<CR>"),
    }
    require("alpha").setup(dashboard.opts)
  end,
}
