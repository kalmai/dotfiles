return {
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    lazy = false,
    keys = {
      { "<leader>?", '<cmd>NoiceTelescope<cr>', desc = "pull up notifications in telescope", silent = true }
    },
    opts = {
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      messages = {
        view = false,
        view_error = false,
        view_warn = false,
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
      },
    }
  }
}
