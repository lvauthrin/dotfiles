-- Keymaps are automatically loaded on the VeryLazy eent
-- Default keymaps that are always set: http://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open urls/files using ddefult system application
vim.keymap.set("n", "gx", [[:silent execute '!open ' . shellescape(expand("<cfile>"), 1)<CR>]], opts)
