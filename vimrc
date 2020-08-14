" Auto-install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'franbach/miramare'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'
Plug 'https://tildegit.org/sloum/gemini-vim-syntax'

call plug#end()

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

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
let mapleader=" "
let g:tmux_navigator_no_mappings = 1

autocmd BufNewFile,BufReadPost *.yml setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.rb  setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.erb setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.md  set filetype=markdown
autocmd FileType ruby setl iskeyword+=?,!

set bg=dark
colorscheme miramare
highlight LineNr guifg=#dddddd ctermfg=DarkGray
set isk+=-
syn on
set bs=2
set laststatus=2
set showtabline=1
set grepprg=rg\ --vimgrep\ --no-heading " Use ripgrep instead of grep
set grepformat=%f:%l:%c:%m,%f:%l:%m     " Set grepformat

nnoremap <leader>j :Buffers<cr>
nnoremap <leader><C-p> :Files<cr>
nnoremap <leader><C-s> :GFiles?<cr>
nnoremap <C-p> :GFiles<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>T :BTags<cr>

nnoremap <silent> <S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <S-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <S-Right> :TmuxNavigateRight<cr>

set mouse=a
set nu
