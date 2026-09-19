local colors = {
  bg        = "#191919", -- statusline
  gray      = "#292626", -- git
  git_text  = "#DAD8CE",
  text_dark = "#191818",

  normal  = "#4385BE",
  insert  = "#8B7EC8",
  visual  = "#7e9f0e",
  cmd     = "#D14D41",
  replace = "#D0A215",
  select  = "#3AA99F",
  term    = "#DA702C",
}

local mode_colors = {
  n = colors.normal, i = colors.insert,
  v = colors.visual, V = colors.visual, [string.char(22)] = colors.visual,
  c = colors.cmd, R = colors.replace,
  s = colors.select, S = colors.select,
  t = colors.term,
}

local mode_map = {
  n = " NOR",
  i = " INS",
  v = " V-N",
  V = " V-L",
  [string.char(22)] = " V-B",
  c = " CMD",
  R = " REP",
  s = " SEL",
  S = " S-L",
  t = " TMN",
}

local function mode_color()
  return mode_colors[vim.fn.mode()] or colors.normal
end

local sep_right = string.char(0xee, 0x82, 0xb0) --  U+E0B0
local sep_left  = string.char(0xee, 0x82, 0xb2) --  U+E0B2

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function() return mode_map[vim.fn.mode()] or vim.fn.mode() end,
          color = function()
            return { bg = mode_color(), fg = colors.text_dark, gui = "bold" }
          end,
        },
        -- a -> b: fg = mode color, bg = gray (git section's bg)
        {
          function() return sep_right end,
          color = function() return { fg = mode_color(), bg = colors.gray } end,
          padding = 0,
        },
      },
      lualine_b = {
        { "branch", color = { bg = colors.gray, fg = colors.git_text } },
        { "diff", color = { bg = colors.gray, fg = colors.git_text } },
        -- b -> c: fg = gray, bg = real statusline bg
        {
          function() return sep_right end,
          color = { fg = colors.gray, bg = colors.bg },
          padding = 0,
        },
      },
      lualine_c = {
        { "filename", path = 1 },
      },
      lualine_x = {
        {
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then return "" end
            local names = {}
            for _, c in ipairs(clients) do table.insert(names, c.name) end
            return "  " .. table.concat(names, ", ")
          end,
        },
        "filetype",
        "diagnostics",
      },
      lualine_y = {
        -- y -> z: fg = mode color, bg = real statusline bg
        {
          function() return sep_left end,
          color = function() return { fg = mode_color(), bg = colors.bg } end,
          padding = 0,
        },
      },
      lualine_z = {
        {
          "location",
          color = function()
            return { bg = mode_color(), fg = colors.text_dark, gui = "bold" }
          end,
        },
      },
    },
  },
}
