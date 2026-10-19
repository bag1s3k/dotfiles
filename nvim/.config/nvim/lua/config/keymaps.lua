-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]])

local wk = require("which-key")

wk.add({
  {
    "<leader>a",
    group = "Apps",
    icon = { icon = "󰀻", color = "yellow" },
  },
})
