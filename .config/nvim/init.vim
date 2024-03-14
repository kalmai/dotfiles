call plug#begin('~/.config/nvim/plugged')
  Plug 'kassio/neoterm'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'airblade/vim-gitgutter'
  Plug 'neomake/neomake'
  Plug 'ayu-theme/ayu-vim'
  Plug 'APZelos/blamer.nvim'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kenn7/vim-arsync'
  Plug 'tpope/vim-rhubarb'
  Plug 'ThePrimeagen/harpoon'
call plug#end()

map <Space> <Leader> " remap leader key from '\' to '<Space>'

" Telescope keybinds
nmap <silent> - :Telescope file_browser path=%:p:h select_buffer=true<CR> " see files in current buffers parent directory
nmap <silent> <LocalLeader>n :Telescope file_browser<CR> " see files at working directory
nmap <silent> <LocalLeader>p <cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_title=""<CR> " search for files based on input
nmap <silent> <LocalLeader>cw :Telescope grep_string word_match=-w prompt_title=""<CR> " search project for word under cursor
nmap <silent> <LocalLeader>f :Telescope live_grep only_sort_text=true prompt_title=""<CR> " search project for instances of input
nmap <silent> <Leader>b <cmd>Telescope buffers sort_mru=true<CR> " browse opened buffers

nmap <silent> <LocalLeader>gd :Git diff<CR> " see git diff in horizontal split

" Ruby
nmap <silent> <Leader>c :! rubocop -a %<cr> " soft autocorrect with rubocop
nmap <silent> <Leader>C :! rubocop -A %<cr> " hard autocorrect with rubocop
nmap <Leader>yy :let @+ = expand("%")<cr> " copy current buffer relative path to clipboard
vnoremap <silent> <LocalLeader>/ :norm i#<cr> " comment out visually selected lines
vnoremap <silent> <LocalLeader>? :norm x<cr> " un-comment out visually selected lines

" Harpoon
map <C-F> <cmd>Telescope harpoon marks<CR> " see all bookmarked files in telescope picker
map <C-A> <cmd>lua require("harpoon.mark").add_file()<CR> " add current buffer to bookmarks
map <C-T> <cmd>lua require("harpoon.ui").nav_next() <CR> " move to next bookmarked file
map <F1> <cmd>lua require("harpoon.ui").nav_file(1)<CR> " hotkey to go to first bookmarked file and so on...
map <F2> <cmd>lua require("harpoon.ui").nav_file(2)<CR>
map <F3> <cmd>lua require("harpoon.ui").nav_file(3)<CR>
map <F4> <cmd>lua require("harpoon.ui").nav_file(4)<CR>
map <F5> <cmd>lua require("harpoon.ui").nav_file(5)<CR>
map <F6> <cmd>lua require("harpoon.ui").nav_file(6)<CR>

map <C-S> <C-W><C-R> " rotate buffers
map <C-Y> "+y " copy visual selectin to clipboard
map <C-H> <C-W><C-H> " move to left buffer
map <C-J> <C-W><C-J> " move to down buffer
map <C-K> <C-W><C-K> " move to up buffer
map <C-L> <C-W><C-L> " move to right buffer
vnoremap <silent> <LocalLeader>gb :GBrowse<CR> " open visual selected line/lines on github

let g:github_enterprise_urls = [''] " browse github enterprise files in github

set confirm
set noautochdir
set number
set visualbell
set cursorline
set shiftwidth=2
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
set mouse=n
set guicursor:n-v-sm:block,i-ci-ve-c:hor20-Cursor,r-cr-o:hor20,a:blinkon50
set noshowmode
let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0
let g:blamer_delay = 2000

set termguicolors

let g:grepper={}
let g:grepper.tools=["rg"]

call neomake#configure#automake('rw')
let g:neomake_ruby_enabled_makers = ['rubocop']

let ayucolor="dark"
colorscheme ayu

highlight clear LineNr 
set t_Co=256
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.undodir   "directory where the undo files will be stored
endif 

" Dim inactive windows using 'colorcolumn' setting
" This tends to slow down redrawing, but is very useful.
" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
" XXX: this will only work with lines containing text (i.e. not '~')
" from 
if exists('+colorcolumn')
  function! s:DimInactiveWindows()
    for i in range(1, tabpagewinnr(tabpagenr(), '$'))
      let l:range = ""
      if i != winnr()
        if &wrap
         " HACK: when wrapping lines is enabled, we use the maximum number
         " of columns getting highlighted. This might get calculated by
         " looking for the longest visible line and using a multiple of
         " winwidth().
         let l:width=256 " max
        else
         let l:width=winwidth(i)
        endif
        let l:range = join(range(1, l:width), ',')
      endif
      call setwinvar(i, '&colorcolumn', l:range)
    endfor
  endfunction
  augroup DimInactiveWindows
    au!
    au WinEnter * call s:DimInactiveWindows()
    au WinEnter * set nocursorline
    au WinLeave * set cursorline
  augroup END
endif

let g:lightline = {
  \ 'colorscheme': 'ayu_dark',
  \ 'active': {
  \   'right': [ [ 'syntastic', 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'gitbranchformatted' ] ],
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'coloredrelpath', 'readonly', 'modified' ] ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'gitbranchformatted': 'FugitiveFormat'
  \ },
  \ 'component': {
  \   'modified': '%#ModifiedColor#%{LightlineModified()}',
  \   'coloredrelpath': '%#Path#%{get(PathText(),0)}%#CurrentFile#%{get(PathText(),1)}'
  \ }
  \ }
function! LightlineModified()
  let map = { 'V': 'n', "\<C-v>": 'n', 's': 'n', 'v': 'n', "\<C-s>": 'n', 'c': 'n', 'R': 'n'}
  let mode = get(map, mode()[0], mode()[0])
  "add last two chars in bgcolor to hex codes below with a 00 for darkmode
  let bgcolor = {'n': [240, '#23293200'], 'i': [31, '#23293200']}
  let color = get(bgcolor, mode, bgcolor.n)
  exe printf('hi ModifiedColor ctermfg=196 ctermbg=%d guifg=#ff0000 guibg=%s term=bold cterm=bold',
  \ color[0], color[1])
  exe printf('hi Path ctermfg=196 ctermbg=%d guifg=#5e6f7f guibg=%s term=bold cterm=bold',
  \ color[0], color[1])
  exe printf('hi CurrentFile ctermfg=196 ctermbg=%d guifg=#ffffff guibg=%s term=bold cterm=bold',
  \ color[0], color[1])
  return &modified ? '++NOT+SAVED++': &modifiable ? '' : '-'
endfunction

function! PathText()
  let file = split(expand('%:f'), '/')
  return len(file) > 0 ? [join(file[0:-2], '/') . (len(file) == 1 ? '' : '/'), file[-1]] : ['', 'No Name']
endfunction

function! FugitiveFormat()
  return winwidth(0) > 120 ? FugitiveHead(): ''
endfunction
  \ }

let g:lightline.inactive = {
  \ 'right': [ [], [ 'percent', 'syntastic', 'lineinfo' ] ],
  \ 'left':  [ [ 'coloredrelpath', 'modified' ] ]
  \ }

let g:webdevicons_enable_airline_statusline = 1

let g:lightline.mode_map = {
  \ 'n' : 'normal',
  \ 'i' : 'insert',
  \ 'R' : 'replace',
  \ 'v' : 'visual',
  \ 'V' : 'v-line',
  \ "\<C-v>": 'v-block',
  \ 'c' : 'command',
  \ 's' : 'select',
  \ 'S' : 's-line',
  \ "\<C-s>": 's-block',
  \ 't': 'terminal',
  \ }
autocmd User TelescopePreviewerLoaded setlocal wrap number
verbose set conceallevel=0
luafile ~/.config/nvim/lua/init.lua
