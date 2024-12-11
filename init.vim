call plug#begin()
"Plug 'neovim/nvim-lspconfig'
"Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'luochen1990/rainbow'
call plug#end()

let g:rainbow_active = 1
let g:tmux_navigator_no_mappings = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1
let g:go_code_completion_enabled = 0
let g:go_gopls_enabled = 1
let g:go_doc_keywordprg_enabled = 0

let mapleader=" "
let maplocalleader=","

autocmd BufNewFile,BufReadPost *.yml setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.rb  setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.erb setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.md  set filetype=markdown
autocmd BufNewFile,BufReadPost *.html set sw=2 ts=2 expandtab indentexpr=
autocmd FileType ruby setl iskeyword+=?,!

colorscheme gruvbox
highlight LineNr guifg=#dddddd ctermfg=DarkGray

set t_ut=
set ts=4
set sw=4
set expandtab
set smarttab
set ai
set directory=/tmp
set lbr
set isk+=-
set bs=2
set laststatus=2
set showtabline=1
set mouse=a
set nu
set modeline
set bg=dark
set signcolumn=yes

nnoremap <leader>j :Buffers<cr>
nnoremap <leader><C-p> :Files<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader><C-s> :GFiles?<cr>
nnoremap <C-p> :GFiles<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>T :BTags<cr>

nnoremap <silent> <S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <S-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <S-Right> :TmuxNavigateRight<cr>

" Look better in cool-retro-term
hi EndOfBuffer ctermbg=none
hi Normal ctermbg=none

nnoremap j gj
nnoremap k gk

"lua require'lspconfig'.gopls.setup{}
"lua require'lspconfig'.rust_analyzer.setup{}
"nnoremap K :lua vim.lsp.buf.hover()<cr>
