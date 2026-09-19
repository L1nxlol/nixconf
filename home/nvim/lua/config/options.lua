vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false

vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.cmd.colorscheme("flexoki-custom")

vim.opt.fillchars:append('eob: ') -- removing '~' on every line
vim.opt.fillchars:append({ vert = " ", eob = " " })
