require("telescope").load_extension('harpoon')
require('telescope').setup({
  defaults = { 
    borderchars = { "", "", "", "", "", "", "", "" },
    results_title = "",
    prompt_title = "",
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
require("telescope").load_extension('file_browser')
