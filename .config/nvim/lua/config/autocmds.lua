local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = augroup("telescope_preview_options"),
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.cmd("setlocal wrap number")
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
local find_files_hijack_netrw = vim.api.nvim_create_augroup("find_files_hijack_netrw", { clear = true })
-- clear FileExplorer appropriately to prevent netrw from launching on folders
-- netrw may or may not be loaded before telescope-find-files
-- conceptual credits to nvim-tree and telescope-file-browser
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  once = true,
  callback = function()
    pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = find_files_hijack_netrw,
  pattern = "*",
  callback = function()
    vim.schedule(function()
      -- Early return if netrw or not a directory
      if vim.bo[0].filetype == "netrw" or vim.fn.isdirectory(vim.fn.expand("%:p")) == 0 then
        return
      end

      vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")

      require("telescope.builtin").find_files({
        cwd = vim.fn.expand("%:p:h"),
      })
    end)
  end,
})

local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
  group = numbertoggle,
  pattern = "*",
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= "i" and vim.api.nvim_buf_line_count(0) < 5000 then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
  group = numbertoggle,
  pattern = "*",
  callback = function()
    if vim.wo.number and vim.api.nvim_buf_line_count(0) < 5000 then
      vim.wo.relativenumber = false
    end
  end,
})
