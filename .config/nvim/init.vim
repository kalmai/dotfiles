set number
set visualbell

if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  set termguicolors
endif
hi Normal ctermbg=NONE

set background=dark
set t_Co=256
colorscheme lucid
