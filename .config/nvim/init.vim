call plug#begin('~/.config/nvim/plugged')
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'kassio/neoterm'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'scrooloose/nerdtree'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/goyo.vim'
call plug#end()

nmap <silent> <LocalLeader>nt :NERDTreeToggle<CR>
nmap <silent> <LocalLeader>p :Files<CR>

set number
set visualbell

if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  set termguicolors

  let g:tokyonight_style = 'storm' " available: night, storm
  let g:tokyonight_enable_italic = 1

  colorscheme tokyonight
endif

set background=dark
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.undodir   "directory where the undo files will be stored
endif 
