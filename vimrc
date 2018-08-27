call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'ervandew/supertab'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Not bothered about vi compatibility
" This must be first, because it changes other options as side effect
set nocompatible
" set term=ansi

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" more secure
set modelines=0

" copy the previous indentation on autoindenting
" set copyindent

" dont autofold on start or load
" set foldlevelstart=99
set nofoldenable

" shows all options in edit wild mode
set wildmode=list:longest

" increase command history and undo
set history=1000
set undolevels=1000

" show the $ at the end of word changes etc
set cpoptions+=$

set number
set relativenumber

" search highlights on, and dynamic searching
" set hlsearch

" These two options, when set together, will
" make /-style searches case-sensitive only
" if there is a capital letter in the search
" expression. *-style searches continue to
" be consistently case-sensitive.
set ignorecase
" set gdefault

set cursorline
set colorcolumn=80
" set ttyfast

" no old messy files
set nobackup
set noswapfile
set nowb

" allow hiding buffers with pending changes
set hidden

" defaults
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" set clipboard=unnamed

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let g:mapleader = "\<Space>"

" handle long lines
set nowrap
set textwidth=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't use Ex mode, use Q for formatting
map Q gq

" clear search buffer when hitting return
" this is mapped to ctrl l in sensible
" but is is a good key to use for something
" nnoremap <silent> <leader><space> :set nolist!<cr>

" dont use cursor keys!
nnoremap <up> <nop>
nnoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Use the arrows to something usefull
nnoremap <right> :bn<cr>
nnoremap <left> :bp<cr>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" makes j and k work the way you expect
nnoremap j gj
nnoremap k gk

" make ; do the same thing as :
nnoremap ; :

" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" avoid pressing F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

xmap \\  <Plug>Commentary<CR>
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine<CR>:normal k<CR>
nmap \\u <Plug>CommentaryUndo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>

" map leader-W to strip white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

map <leader>e :edit %%
" map <leader>v :view %%

" reselect the text that was just pasted
nnoremap <leader>v V`]

" Switch between the last two files
nnoremap <leader><leader> <c-^>

nnoremap <leader>p :set paste!<cr>

nnoremap <leader>q gqip
nmap <leader>m :make<cr>:copen<cr>

" set background=dark
set encoding=utf-8
" set t_Co=16

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
