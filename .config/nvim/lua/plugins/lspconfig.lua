return {
  "neovim/nvim-lspconfig",
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
        "bacon_ls",
        "gopls",
        "lua_ls",
        "rust_analyzer",
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
      virtual_text = {
        enabled = true,
        prefix = "⇠ "
      },
      underline = false,
      signs = false,
      wrap = true,
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "F", vim.lsp.buf.hover, opts)
        -- vim.keymap.set("n", "K", vim.lsp.buf.definition, opts)
        -- vim.keymap.set("n", "K", ":Telescope lsp_definitions bufnr=0<cr>", { silent = true })
        -- vim.keymap.set("n", "M", vim.lsp.buf.declaration, opts)
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "C", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}
