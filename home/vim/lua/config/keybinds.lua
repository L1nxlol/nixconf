vim.keymap.set({"n", "v"}, "d", '"_d', { desc = "Delete" })
vim.keymap.set({"n", "v"}, "x", '"_x', { desc = "Delete" })
vim.keymap.set({"n", "v"}, "c", '"_c', { desc = "Swap" })
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")


-- Tab management
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeFocus<CR>")


vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>")
