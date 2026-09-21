vim.keymap.set({"n", "v"}, "d", '"_d', { desc = "Delete" })
vim.keymap.set({"n", "v"}, "c", '"_c', { desc = "Swap" })
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")


-- Tab management
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeFocus<CR>")


vim.keymap.set("n", "<leader>u", "<Cmd>UndotreeToggle<CR>")



-- Telescope

local function find_up(levels, opts)
  opts = opts or {}
  return function()
    local cwd = vim.fn.getcwd()
    for _ = 1, levels do
      cwd = cwd .. "/.."
    end
    opts.cwd = cwd
    require("telescope.builtin").find_files(opts)
  end
end

vim.keymap.set("n", "<leader>ff", find_up(0))
for i = 1, 9 do
  vim.keymap.set("n", "<leader>f" .. i .. "f", find_up(i))
end

vim.keymap.set("n", "<leader>fh", find_up(0, { hidden = true }))
for i = 1, 9 do
  vim.keymap.set("n", "<leader>f" .. i .. "h", find_up(i, { hidden = true }))
end

-- vim.keymap.set("n", "<leader>ff", function()
--   require("telescope.builtin").find_files()
-- end)
vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end)
vim.keymap.set("n", "<leader>fl", function()
  require("telescope.builtin").help_tags()
end)
-- vim.keymap.set("n", "<leader>fh", function()
--   builtin.find_files({ hidden = true })
-- end, {})


-- Comment
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment line" })

vim.keymap.set("x", "<leader>/", function()
  local api = require("Comment.api")
  local vmode = vim.fn.mode()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  if vmode == "V" then
    api.toggle.linewise(vmode)
  else
    api.toggle.blockwise(vmode)
  end
end, { desc = "Comment selection" })
