" Minimalistic Vim Config

set noerrorbells
set nowrap
set nu
set relativenumber
set noswapfile
set scrolloff=8
set cindent
set nocompatible              " required
filetype off                  " required
syntax on


" Plugins
call plug#begin('~/local/share/nvim/plugged')

Plug 'jiangmiao/auto-pairs'

Plug 'gmarik/Vundle.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'gosukiwi/vim-atom-dark'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-python/python-syntax'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()


" Cmmenting out python code
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

" Fugative
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Colorscheme Config
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox


let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:ycm_autoclose_preview_window_after_completion=1
let g:vim_be_good_floating = 0

" Code formatting
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


" Fixes COC tabs
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" for clangd
let g:LanguageClient_serverCommands = {
  \ 'cpp': ['clangd'],
  \ }

" Automatically closing braces for C
" inoremap {<CR> {<CR>}<Esc>ko
