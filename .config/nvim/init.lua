-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("plugins.lspconfig")
require("darkrose").setup({
  styles = {
    bold = true,      -- Enable bold highlights for some highlight groups
    italic = false,   -- Enable italic highlights for some highlight groups
    underline = true, -- Enable underline highlights for some highlight groups
  }
})

vim.cmd.colorscheme("darkrose")
