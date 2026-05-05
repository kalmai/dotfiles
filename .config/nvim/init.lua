-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_create_autocmd("VimEnter",{callback=function()require"lazy".update({show = false})end})
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("plugins.lspconfig")
require('vague').setup({
  transparent = false, -- If true, background is not set
  bold = true, -- Disable bold globally
  italic = false, -- Disable italic globally
})

vim.cmd.colorscheme("vague")
