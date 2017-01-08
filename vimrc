set ts=4
set sw=4
set expandtab
set smarttab
set ai
set guioptions=mgr
set guitablabel=%t
set directory=/tmp
set t_Co=256
set guifont=Sudo:h18
set lbr

set rtp+=/usr/local/opt/fzf

execute pathogen#infect()

autocmd BufNewFile,BufReadPost *.yml setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.rb  setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.erb setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.md  set filetype=markdown

set bg=dark
if has("gui_running")
  colorscheme solarized
endif
" colorscheme nofrils-dark
highlight LineNr guifg=#dddddd ctermfg=DarkGray
set isk+=-
syn on
set bs=2

set laststatus=2
set showtabline=1

set grepprg=rg\ --vimgrep\ --no-heading " Use ripgrep instead of grep
set grepformat=%f:%l:%c:%m,%f:%l:%m     " Set grepformat
