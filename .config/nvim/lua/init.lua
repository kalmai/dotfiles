require("telescope").load_extension('harpoon')
require('telescope').setup({
  defaults = { 
    borderchars = { "", "", "", "", "", "", "", "" },
    results_title = "",
    prompt_title = "",
    cache_picker = {
      num_pickers = 20,
      limit_entries = 50,
      ignore_empty_prompt = true,
    },
    path_display={ "smart" },
    file_ignore_patterns = { "%.git" },
    dynamic_preview_title = false,
    color_devicons = true,
    mappings = {
      i = {
        ["<C-u>"] = false
      },
      n = {
        ['<c-d>'] = require('telescope.actions').delete_buffer
      },
    },
    layout_config = {
      preview_width = 0.65,
      width = 0.9999,
      height = 100,
    },
  },
  extensions = {
    file_browser = {
      cwd_to_path = true,
      auto_depth = 2,
      files = true,
      display_stat = {},
    }
  }
})
require("darkrose").setup({
    -- Override colors
    colors = {
    },
    -- Override existing or add new highlight groups
    -- Styles to enable or disable
    styles = {
        bold = true, -- Enable bold highlights for some highlight groups
        italic = false, -- Enable italic highlights for some highlight groups
        underline = false, -- Enable underline highlights for some highlight groups
    }
})
vim.cmd.colorscheme("darkrose")
vim.o.termguicolors = true
require("telescope").load_extension('file_browser')

