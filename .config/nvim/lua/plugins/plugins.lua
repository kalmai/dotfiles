return {
  'water-sucks/darkrose.nvim',
  'airblade/vim-gitgutter',
  'APZelos/blamer.nvim',
  'tpope/vim-fugitive',
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',
  'tpope/vim-rhubarb',
  { 'karb94/neoscroll.nvim', opts = {} },
  'fatih/vim-go',
  'rust-lang/rust.vim',
  {
    'mrcjkb/rustaceanvim',
    version = '^8', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  { 'nvim-mini/mini.indentscope', config = function() return require("mini.indentscope").setup({ symbol = '│' }) end, },
  { 'aserowy/tmux.nvim', config = function() return require("tmux").setup() end }
}
