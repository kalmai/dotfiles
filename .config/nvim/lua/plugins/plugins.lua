return {
  'water-sucks/darkrose.nvim',
  'airblade/vim-gitgutter',
  'APZelos/blamer.nvim',
  'tpope/vim-fugitive',
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',
  'tpope/vim-rhubarb',
  "karb94/neoscroll.nvim",
  -- 'fatih/vim-go',
  -- 'rust-lang/rust.vim'
  { 'nvim-mini/mini.indentscope', config = function() return require("mini.indentscope").setup({ symbol = '│' }) end, },
  { 'aserowy/tmux.nvim', config = function() return require("tmux").setup() end }
}
