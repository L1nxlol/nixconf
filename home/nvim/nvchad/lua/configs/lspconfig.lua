require("nvchad.configs.lspconfig").defaults()

vim.lsp.config.qmlls = {
  cmd = { "qmlls" },
  filetypes = { "qml" },
  root_dir = require("lspconfig.util").root_pattern(".git"),
}

local servers = { "html", "cssls"}
vim.lsp.enable(servers)
-- require("lspconfig").qmlls.setup {}
-- read :h vim.lsp.config for changing options of lsp servers 

