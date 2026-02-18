return {
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    lazy = false,
    keys = {
      { "<leader>?", '<cmd>NoiceTelescope<cr>', desc = "pull up notifications in telescope", silent = true }
    },
    opts = {
      routes = {
        {
          view = "notify",
          filter = {
            event = "msg_show",
            kind = {
              "shell_out",
              "shell_err",
            },
          },
        },
      },
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = "62%",
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        confirm = {
          position = {
            row = "50%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "none",
            padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        }
      },
    }
  }
}
