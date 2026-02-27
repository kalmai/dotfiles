local opt = vim.opt

opt.confirm = true
opt.autochdir = false
opt.number = true
opt.relativenumber = true
opt.visualbell = false
opt.cursorline = true
opt.listchars = "tab:   ,trail:~,extends:>,precedes:<"
opt.list = true
opt.mouse = "n"
opt.guicursor = 'n-v-sm:block,i-ci-ve-c:hor20-Cursor,r-cr-o:hor20,a:blinkon50'
opt.showmatch = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 0

local g = vim.g

-- g.clipboard = 'pbcopy' -- for macOS
g.github_enterprise_urls = { '' }
g.go_doc_keywordprg_enabled = 0 -- allows usage of 'K' to be opened in telescope
g.go_fmt_autosave = 0
g.blamer_enabled = 1
g.blamer_show_in_insert_modes = 0
g.blamer_delay = 2000

g.indent_guides_enable_on_vim_startup = 1
g.indent_guides_exclude_buftype = 1
g.indent_guides_auto_colors = 0

g.grepper = {}
g.grepper.tools = "rg"
