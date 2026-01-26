return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'BurntSushi/ripgrep',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    keys = {
      { "<leader>b",  '<cmd>Telescope buffers sort_mru=true prompt_title=buffers<cr>',                                    desc = "list all open buffers",                                            silent = true },
      { "-",          "<cmd>Telescope file_browser path=%:p:h select_buffer=true hidden=true prompt_title=cwd_files<cr>", desc = "browse files in current directory",                                silent = true },
      { "<leader>r",  "<cmd>Telescope resume prompt_title=last_picker<cr>",                                               desc = "reopen most recent picker",                                        silent = true },
      { "<leader>h",  "<cmd>Telescope pickers prompt_title=picker_hist<cr>",                                              desc = "view history of recent pickers",                                   silent = true },
      { "<leader>n",  "<cmd>Telescope file_browser hidden=true prompt_title=pwd_files<cr>",                                                      desc = "open file picker at root of pwd",                                  silent = true },
      { "<leader>p",  '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_title=file_grep<cr>',   desc = "browse files by name in pwd",                                      silent = true },
      { "<leader>cw", '<cmd>Telescope grep_string word_match=-w prompt_title=hover_grep<cr>',                             desc = "look up word under cursor",                                        silent = true },
      { "<leader>f",  '<cmd>Telescope live_grep only_sort_text=true smartcase=true prompt_title=grep<cr>',                desc = "search for a term in pwd",                                         silent = true },
      { "K",          '<cmd>Telescope lsp_definitions bufnr=0 prompt_title=go_def<cr>',                                   { desc = "go to def. if multiple, open telescope picker", silent = true }, },
    },
    -- change some options
    opts = {
      defaults = {
        borderchars = { "", "", "", "", "", "", "", "" },
        results_title = "",
        prompt_title = "",
        cache_picker = {
          num_pickers = 20,
          limit_entries = 50,
          ignore_empty_prompt = true,
        },
        path_display = { "smart" },
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
    },
  },
}
