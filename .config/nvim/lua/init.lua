require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ruby_lsp",
    "bacon_ls",
    "gopls",
    "lua_ls",
    "rubocop",
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
    { name = 'nvim_lsp' }
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
    ["<C-j>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
    }),
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
    end, { "i" }),
    ["<C-p>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i" }),
  }),
}

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
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
  capabilities = lsp_capabilities,
  root_markers = { '.git' },
})
vim.diagnostic.config({
  virtual_text = true,
  underline = false,
  signs = false,
  wrap = true,
})
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        -- vim.keymap.set("n", "f", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "F", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.definition, opts)
        -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "c", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})
vim.cmd.colorscheme("darkrose")
vim.o.termguicolors = true
require("telescope").load_extension('file_browser')
