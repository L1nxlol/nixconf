vim.g.colors_name = "flexoki-custom"
vim.o.background = "dark"
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

local colors = {
  -- base_30
  white = "#CECDC3",
  darker_black = "#171616",
  black = "#100F0F",
  black2 = "#1c1b1b",
  one_bg = "#292626",
  one_bg2 = "#353232",
  one_bg3 = "#373434",
  grey = "#393636",
  grey_fg = "#555050",
  grey_fg2 = "#5f5959",
  light_grey = "#6a6363",
  red = "#D14D41",
  baby_pink = "#d36da1",
  pink = "#CE5D97",
  line = "#292626",
  green = "#879A39",
  vibrant_green = "#7e9f0e",
  nord_blue = "#4385BE",
  blue = "#4385BE",
  yellow = "#D0A215",
  sun = "#eabb2b",
  purple = "#8B7EC8",
  dark_purple = "#7f70c2",
  teal = "#519ABA",
  orange = "#DA702C",
  cyan = "#3AA99F",
  lightbg = "#292626",
  statusline_bg = "#171616",
  pmenu_bg = "#3AA99F",
  folder_bg = "#4385BE",

  -- base_16
  base00 = "#100F0F",
  base01 = "#1c1b1b",
  base02 = "#292626",
  base03 = "#393636",
  base04 = "#555050",
  base05 = "#CECDC3",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#D14D41",
  base09 = "#DA702C",
  base0A = "#8B7EC8",
  base0B = "#879A39",
  base0C = "#3AA99F",
  base0D = "#4385BE",
  base0E = "#D0A215",
  base0F = "#519ABA",
}

local hl = vim.api.nvim_set_hl

-- Editor UI
hl(0, "Normal", { fg = colors.white, bg = colors.black })
hl(0, "NormalFloat", { fg = colors.white, bg = colors.black2 })
hl(0, "NormalNC", { fg = colors.white, bg = colors.black })
hl(0, "CursorLine", { bg = colors.one_bg })
hl(0, "CursorLineNr", { fg = colors.white, bold = true })
hl(0, "LineNr", { fg = colors.grey_fg })
hl(0, "SignColumn", { bg = colors.black })
hl(0, "StatusLine", { fg = colors.white, bg = colors.statusline_bg })
hl(0, "StatusLineNC", { fg = colors.grey_fg, bg = colors.statusline_bg })
hl(0, "VertSplit", { fg = colors.black })
hl(0, "WinSeparator", { fg = colors.black, bg = colors.black })
hl(0, "Pmenu", { fg = colors.white, bg = colors.one_bg })
hl(0, "PmenuSel", { fg = colors.black, bg = colors.pmenu_bg })
hl(0, "PmenuSbar", { bg = colors.one_bg2 })
hl(0, "PmenuThumb", { bg = colors.grey_fg2 })
hl(0, "Search", { fg = colors.black, bg = colors.yellow })
hl(0, "IncSearch", { fg = colors.black, bg = colors.pmenu_bg })
hl(0, "Visual", { bg = colors.one_bg2 })
hl(0, "Directory", { fg = colors.folder_bg })
hl(0, "Title", { fg = colors.blue, bold = true })
hl(0, "NonText", { fg = colors.grey })
hl(0, "Whitespace", { fg = colors.grey })
hl(0, "MatchParen", { fg = colors.sun, bold = true })
hl(0, "FoldColumn", { fg = colors.grey_fg, bg = colors.black })
hl(0, "Folded", { fg = colors.grey_fg, bg = colors.one_bg })

-- Diffs
hl(0, "DiffAdd", { fg = colors.green, bg = "NONE" })
hl(0, "DiffChange", { fg = colors.yellow, bg = "NONE" })
hl(0, "DiffDelete", { fg = colors.red, bg = "NONE" })
hl(0, "DiffText", { fg = colors.blue, bg = "NONE" })

-- Syntax
hl(0, "Comment", { fg = colors.grey_fg, italic = true })
hl(0, "Constant", { fg = colors.orange })
hl(0, "String", { fg = colors.green })
hl(0, "Character", { fg = colors.green })
hl(0, "Number", { fg = colors.orange })
hl(0, "Boolean", { fg = colors.orange })
hl(0, "Identifier", { fg = colors.red })
hl(0, "Function", { fg = colors.blue })
hl(0, "Statement", { fg = colors.purple })
hl(0, "Conditional", { fg = colors.purple })
hl(0, "Repeat", { fg = colors.purple })
hl(0, "Keyword", { fg = colors.yellow })
hl(0, "Operator", { fg = colors.white })
hl(0, "PreProc", { fg = colors.yellow })
hl(0, "Include", { fg = colors.yellow })
hl(0, "Type", { fg = colors.yellow })
hl(0, "StorageClass", { fg = colors.yellow })
hl(0, "Structure", { fg = colors.yellow })
hl(0, "Special", { fg = colors.teal })
hl(0, "Tag", { fg = colors.blue })
hl(0, "Underlined", { underline = true })
hl(0, "Error", { fg = colors.red })
hl(0, "Todo", { fg = colors.yellow, bold = true })

-- Treesitter
hl(0, "@variable.parameter", { fg = colors.baby_pink })
hl(0, "@module", { fg = colors.purple })

hl(0, "@keyword", { fg = colors.red })
hl(0, "@keyword.function", { fg = colors.pink })     -- def, lambda
hl(0, "@keyword.return", { fg = colors.red })       -- return, yield
hl(0, "@keyword.exception", { fg = colors.red })     -- raise, try, except, finally
hl(0, "@keyword.conditional", { fg = colors.yellow }) -- if, elif, else
hl(0, "@keyword.import", { fg = colors.yellow })     -- import, from, as
hl(0, "@keyword.repeat", { fg = colors.vibrant_green })     -- for, while
hl(0, "@keyword.operator", { fg = colors.white })    -- and, or, not, in, is

hl(0, "@string.special.url", { fg = colors.green })
hl(0, "@markup.link.url", { fg = colors.vibrant_green })
hl(0, "@comment", { fg = colors.grey_fg, italic = true })
hl(0, "@type.builtin", { fg = colors.yellow })
hl(0, "@operator", { fg = colors.white })
hl(0, "@tag", { fg = colors.blue })
hl(0, "@tag.attribute", { fg = colors.orange })

hl(0, "@boolean", { fg = colors.cyan })
hl(0, "@constant", { fg = colors.teal })
hl(0, "@string", { fg = colors.green})
hl(0, "@type", { fg = colors.purple })
hl(0, "@variable", { fg = colors.dark_purple })
hl(0, "@function", { fg = colors.orange })

hl(0, "@punctuation.delimiter", { fg = colors.white })
hl(0, "@punctuation.bracket", { fg = colors.yellow })

-- LSP diagnostics
hl(0, "DiagnosticError", { fg = colors.base08 })
hl(0, "DiagnosticWarn", { fg = colors.base0E })
hl(0, "DiagnosticInfo", { fg = colors.base0D })
hl(0, "DiagnosticHint", { fg = colors.base0F })
hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = colors.base08 })
hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = colors.base0E })
hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = colors.base0D })
hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = colors.base0F })



-- NvTree
hl(0, "NvimTreeNormal", { fg = colors.white, bg = colors.darker_black })
hl(0, "NvimTreeNormalNC", { fg = colors.white, bg = colors.darker_black })
hl(0, "NvimTreeWinSeparator", { fg = colors.line, bg = colors.darker_black })
hl(0, "NvimTreeEndOfBuffer", { fg = colors.darker_black, bg = colors.darker_black })

hl(0, "NvimTreeGitDirty", { fg = colors.red })
hl(0, "NvimTreeGitStaged", { fg = colors.vibrant_green })
hl(0, "NvimTreeGitNew", { fg = colors.sun })
hl(0, "NvimTreeGitDeleted", { fg = colors.baby_pink })
hl(0, "NvimTreeGitRenamed", { fg = colors.teal })
hl(0, "NvimTreeGitIgnored", { fg = colors.grey_fg })
hl(0, "NvimTreeGitMerge", { fg = colors.orange })
hl(0, "NvimTreeSpecialFile", { fg = colors.yellow, underline = true })
hl(0, "NvimTreeExecFile", { fg = colors.green, bold = true })
hl(0, "NvimTreeSymlink", { fg = colors.cyan })
hl(0, "NvimTreeSymlinkFolderName", { fg = colors.cyan })
hl(0, "NvimTreeImageFile", { fg = colors.baby_pink })
hl(0, "NvimTreeOpenedFile", { fg = colors.white, bold = true })

hl(0, "NvimTreeFolderIcon", { fg = colors.folder_bg })
hl(0, "NvimTreeFolderName", { fg = colors.blue })
hl(0, "NvimTreeOpenedFolderName", { fg = colors.blue, bold = true })
hl(0, "NvimTreeEmptyFolderName", { fg = colors.grey_fg })
hl(0, "NvimTreeIndentMarker", { fg = colors.grey })
hl(0, "NvimTreeRootFolder", { fg = colors.purple, bold = true })



-- BufferLine
hl(0, "BufferLineFill", { bg = colors.statusline_bg })
hl(0, "BufferLineBackground", { fg = colors.grey_fg, bg = colors.statusline_bg })

hl(0, "BufferLineTab", { fg = colors.grey_fg, bg = colors.statusline_bg })
hl(0, "BufferLineTabSelected", { fg = colors.white, bg = colors.base00 })
hl(0, "BufferLineTabClose", { fg = colors.red, bg = colors.statusline_bg })

hl(0, "BufferLineBufferVisible", { fg = colors.grey_fg, bg = colors.statusline_bg })
hl(0, "BufferLineBufferSelected", { fg = colors.white, bg = colors.base00, bold = true })

hl(0, "BufferLineCloseButton", { fg = colors.red, bg = colors.statusline_bg })
hl(0, "BufferLineCloseButtonVisible", { fg = colors.red, bg = colors.statusline_bg })
hl(0, "BufferLineCloseButtonSelected", { fg = colors.red, bg = colors.base00 })

hl(0, "BufferLineNumbers", { fg = colors.grey_fg, bg = colors.statusline_bg })
hl(0, "BufferLineNumbersVisible", { fg = colors.grey_fg, bg = colors.statusline_bg })
hl(0, "BufferLineNumbersSelected", { fg = colors.white, bg = colors.base00 })

hl(0, "BufferLineHint", { fg = colors.teal, bg = colors.statusline_bg })
hl(0, "BufferLineHintVisible", { fg = colors.teal, bg = colors.statusline_bg })
hl(0, "BufferLineHintSelected", { fg = colors.teal, bg = colors.base00 })
hl(0, "BufferLineInfo", { fg = colors.blue, bg = colors.statusline_bg })
hl(0, "BufferLineInfoVisible", { fg = colors.blue, bg = colors.statusline_bg })
hl(0, "BufferLineInfoSelected", { fg = colors.blue, bg = colors.base00 })
hl(0, "BufferLineWarning", { fg = colors.yellow, bg = colors.statusline_bg })
hl(0, "BufferLineWarningVisible", { fg = colors.yellow, bg = colors.statusline_bg })
hl(0, "BufferLineWarningSelected", { fg = colors.yellow, bg = colors.base00 })
hl(0, "BufferLineError", { fg = colors.red, bg = colors.statusline_bg })
hl(0, "BufferLineErrorVisible", { fg = colors.red, bg = colors.statusline_bg })
hl(0, "BufferLineErrorSelected", { fg = colors.red, bg = colors.base00 })

hl(0, "BufferLineHintDiagnostic", { fg = colors.teal, bg = colors.statusline_bg })
hl(0, "BufferLineHintDiagnosticVisible", { fg = colors.teal, bg = colors.statusline_bg })
hl(0, "BufferLineHintDiagnosticSelected", { fg = colors.teal, bg = colors.base00 })
hl(0, "BufferLineInfoDiagnostic", { fg = colors.blue, bg = colors.statusline_bg })
hl(0, "BufferLineInfoDiagnosticVisible", { fg = colors.blue, bg = colors.statusline_bg })
hl(0, "BufferLineInfoDiagnosticSelected", { fg = colors.blue, bg = colors.base00 })
hl(0, "BufferLineWarningDiagnostic", { fg = colors.yellow, bg = colors.statusline_bg })
hl(0, "BufferLineWarningDiagnosticVisible", { fg = colors.yellow, bg = colors.statusline_bg })
hl(0, "BufferLineWarningDiagnosticSelected", { fg = colors.yellow, bg = colors.base00 })
hl(0, "BufferLineErrorDiagnostic", { fg = colors.red, bg = colors.statusline_bg })
hl(0, "BufferLineErrorDiagnosticVisible", { fg = colors.red, bg = colors.statusline_bg })
hl(0, "BufferLineErrorDiagnosticSelected", { fg = colors.red, bg = colors.base00 })

hl(0, "BufferLineModified", { fg = colors.green, bg = colors.statusline_bg })
hl(0, "BufferLineModifiedVisible", { fg = colors.green, bg = colors.statusline_bg })
hl(0, "BufferLineModifiedSelected", { fg = colors.green, bg = colors.base00 })

hl(0, "BufferLineDuplicate", { fg = colors.grey_fg, bg = colors.statusline_bg, italic = true })
hl(0, "BufferLineDuplicateVisible", { fg = colors.grey_fg, bg = colors.statusline_bg, italic = true })
hl(0, "BufferLineDuplicateSelected", { fg = colors.white, bg = colors.base00, italic = true })

hl(0, "BufferLineSeparator", { fg = colors.statusline_bg, bg = colors.statusline_bg })
hl(0, "BufferLineSeparatorVisible", { fg = colors.statusline_bg, bg = colors.statusline_bg })
hl(0, "BufferLineSeparatorSelected", { fg = colors.statusline_bg, bg = colors.base00 })

hl(0, "BufferLineIndicatorVisible", { fg = colors.statusline_bg, bg = colors.statusline_bg })
hl(0, "BufferLineIndicatorSelected", { fg = colors.statusline_bg, bg = colors.base00 })

hl(0, "BufferLinePick", { fg = colors.red, bg = colors.statusline_bg, bold = true })
hl(0, "BufferLinePickVisible", { fg = colors.red, bg = colors.statusline_bg, bold = true })
hl(0, "BufferLinePickSelected", { fg = colors.red, bg = colors.base00, bold = true })

hl(0, "BufferLineOffsetSeparator", { fg = colors.line, bg = colors.statusline_bg })
hl(0, "BufferLineTruncMarker", { fg = colors.grey_fg, bg = colors.statusline_bg })
hl(0, "BufferLineGroupLabel", { fg = colors.purple, bg = colors.statusline_bg })
hl(0, "BufferLineGroupSeparator", { fg = colors.grey_fg, bg = colors.statusline_bg })
