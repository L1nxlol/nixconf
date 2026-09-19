return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus" },
  opts = {
    hijack_cursor = true,
    renderer = {
      root_folder_label = false,
      indent_markers = {
        enable = true,
      },

      highlight_git = true,
      icons = {
        show = {
          git = true,
          folder = true,
          file = true,
          folder_arrow = true,
        },
        glyphs = {
          git = {
            unstaged = "✗",
            staged = "★",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "✗",
            ignored = "◌",
          },

          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
    },
  },
}
