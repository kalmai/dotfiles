vim.keymap.set("v", "<C-y>", '"+y', { desc = "copy visual selection" })
vim.keymap.set("v", "<leader>gb", '<cmd>GBrowse<cr>',
  { desc = "open file at visually selected line number", silent = true })

vim.keymap.set("n", "<leader>yy", '<cmd>let @+ = expand("%")<cr>', { desc = "copy relative path to file from pwd" })
vim.keymap.set("n", "<C-s>", '<C-W><C-R>', { desc = "rotate split buffers" })
vim.keymap.set("n", "<C-h>", '<C-W><C-H>', { desc = "move to left split buffer" })
vim.keymap.set("n", "<C-j>", '<C-W><C-J>', { desc = "move to lower split buffer" })
vim.keymap.set("n", "<C-k>", '<C-W><C-K>', { desc = "move to upper split buffer" })
vim.keymap.set("n", "<C-l>", '<C-W><C-L>', { desc = "move to right split buffer" })
