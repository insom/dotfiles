" Auto-install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

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
"
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:rainbow_active = 1

call plug#end()

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1

let g:go_code_completion_enabled = 0
let g:go_gopls_enabled = 1
let g:go_doc_keywordprg_enabled = 0

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
let maplocalleader=","
let g:tmux_navigator_no_mappings = 1
" let loaded_matchparen = 1

autocmd BufNewFile,BufReadPost *.yml setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.rb  setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.erb setl shiftwidth=2 ts=2 expandtab
autocmd BufNewFile,BufReadPost *.md  set filetype=markdown
autocmd BufNewFile,BufReadPost *.html set sw=2 ts=2 expandtab indentexpr=
autocmd FileType ruby setl iskeyword+=?,!

set bg=dark
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

nnoremap j gj
nnoremap k gk

lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.rust_analyzer.setup{}
nnoremap K :lua vim.lsp.buf.hover()

lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }
EOF
