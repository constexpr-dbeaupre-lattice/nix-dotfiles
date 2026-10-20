local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<cr>")
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("v", "<", "<gv")
map("v", ">", ">gv")
