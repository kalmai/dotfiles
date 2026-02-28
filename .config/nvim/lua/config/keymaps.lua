vim.keymap.set("v", "<C-y>", '"+y', { desc = "copy visual selection" })
vim.keymap.set("v", "<leader>gb", ':GBrowse!<cr>', { desc = "copy link to file at visually selected line number", silent = true })
vim.keymap.set("v", "<leader>gB", ':GBrowse<cr>', { desc = "open file at visually selected line number", silent = true })

vim.keymap.set("n", "<leader>yy", '<cmd>let @+ = expand("%")<cr>', { desc = "copy relative path to file from pwd" })
vim.keymap.set("n", "<C-s>", '<C-W><C-R>', { desc = "rotate split buffers" })
vim.keymap.set("n", "<C-z>", '<Nop>', { desc = "disable sending nvim to background so we can use tmux.nvim to fullsize panes with the key" })

for count=1,12 do vim.keymap.set("n", "<F" .. count .. ">", "<cmd>LualineBuffersJump! " .. count .. "<cr>") end
vim.keymap.set("n", "<leader>j", ":LualineBuffersJump! ")
