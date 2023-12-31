-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Esc out of any mode
vim.keymap.set("n", "<C-space>", "<Esc>:noh<cr>")
vim.keymap.set("v", "<C-space>", "<Esc>gV")
vim.keymap.set("o", "<C-space>", "<Esc>")
vim.keymap.set("c", "<C-space>", "<C-c>")
vim.keymap.set("i", "<C-space>", "<Esc>")
