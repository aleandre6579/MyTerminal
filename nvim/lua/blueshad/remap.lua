vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", ":Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>fw", ":%s///gI<left><left><left><left>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
