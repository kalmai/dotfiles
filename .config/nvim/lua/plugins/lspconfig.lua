return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    "mason-org/mason.nvim",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ruby_lsp",
        "gopls",
        "lua_ls",
        "ts_ls",
        "cssls",
        "html",
        "jsonls"
      }
    }
    )

    local cmp = require("cmp")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        {
          name = 'buffer',
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end
          }
        },
      },
      -- preselect = cmp.PreselectMode.None,
      -- completion = { completeopt = "noselect" },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-c>"] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-n>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            else
              cmp.select_next_item()
            end
          elseif has_words_before() then
            cmp.complete()
            if #cmp.get_entries() == 1 then
              cmp.confirm({ select = true })
            end
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          end
        end, { "i" }),
      }),
    }

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config('*', {
      capabilities = capabilities,
      root_markers = { '.git' },
    })
    vim.diagnostic.config({
      update_in_insert = false,
      virtual_text = {
        enabled = true,
        prefix = "⇠ "
      },
      underline = false,
      signs = false,
      wrap = true,
    })
  end,
}
