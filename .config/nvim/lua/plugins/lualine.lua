return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      fmt = string.lower,
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        refresh_time = 16, -- ~60fps
        events = {
          'WinEnter',
          'BufEnter',
          'BufWritePost',
          'SessionLoadPost',
          'FileChangedShellPost',
          'VimResized',
          'Filetype',
          'CursorMoved',
          'CursorMovedI',
          'ModeChanged',
        },
      },
      sections = {
        lualine_a = { { 'mode', fmt = string.lower } },
        lualine_b = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '',
              readonly = '',
              unnamed = '',
              newfile = ''
            },
          },
          {
            'filename',
            path = 0,
            symbols = {
              modified = '++NOT+SAVED++',
              readonly = 'read-only',
              unnamed = 'no-name',
              newfile = 'new'
            },
            color = function(_)
              return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
            end,
            fmt = function(name, _)
              local t = {}
              for str in string.gmatch(name, '([^' .. ' ' .. ']+)')
              do
                table.insert(t, str)
              end
              return t[2]
            end,
          }
        },
        lualine_c = { { 'diagnostics', sources = { 'nvim_lsp' }, symbols = { error = 'e', warn = 'w', info = 'i', hint = 'h' }, } },
        lualine_x = { 'searchcount' },
        lualine_y = { { 'progress', fmt = string.lower } },
        lualine_z = { 'branch' }
      },
      inactive_sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '',
              readonly = '',
              unnamed = '',
              newfile = ''
            },
          },
        },
        lualine_b = {
          {
            'filename',
            path = 0,
            symbols = {
              modified = '++NOT+SAVED++',
              readonly = 'read-only',
              unnamed = 'no-name',
              newfile = 'new'
            },
            color = function(_)
              return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
            end,
            fmt = function(name, _)
              local t = {}
              for str in string.gmatch(name, '([^' .. ' ' .. ']+)')
              do
                table.insert(t, str)
              end
              return t[2]
            end,
          }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'branch' }
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    },
  },
}
