" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-vinegar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

call plug#end()

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1

"if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  set termguicolors
"endif

" disable Background Color Erase (BCE)
set t_ut=

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
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0
let loaded_matchparen = 1

autocmd BufNewFile,BufReadPost *.yml setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.rb  setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.erb setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.md  set filetype=markdown
autocmd BufNewFile,BufReadPost *.html set sw=2 ts=2 expandtab indentexpr=
autocmd FileType ruby setl iskeyword+=?,!

colorscheme gruvbox
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
nnoremap <leader>f :Files<cr>
nnoremap <leader><C-s> :GFiles?<cr>
nnoremap <C-p> :GFiles<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>T :BTags<cr>
nnoremap <leader>wj :VimwikiMakeDiaryNote<cr>

nnoremap <silent> <S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <S-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <S-Right> :TmuxNavigateRight<cr>

set mouse=a
set nu

set modeline

" set notgc

" Look better in cool-retro-term
hi EndOfBuffer ctermbg=none
hi Normal ctermbg=none
set bg=dark

set signcolumn=yes
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
