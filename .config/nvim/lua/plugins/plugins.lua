return {
  'water-sucks/darkrose.nvim',
  'airblade/vim-gitgutter',
  'APZelos/blamer.nvim',
  'tpope/vim-fugitive',
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',
  'tpope/vim-rhubarb',
  -- 'fatih/vim-go',
  -- 'rust-lang/rust.vim'
  {
    'aserowy/tmux.nvim',
    config = function() return require("tmux").setup() end
  }
}
