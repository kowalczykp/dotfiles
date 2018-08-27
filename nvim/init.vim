call plug#begin('~/.local/share/nvim/plugged')
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
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'ervandew/supertab'

Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-afterimage'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-vividchalk'
Plug 'icymind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'janko-m/vim-test'
Plug 'roxma/vim-tmux-clipboard'
Plug 'w0rp/ale'
Plug 'mhinz/vim-grepper'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'
Plug 'sheerun/vim-polyglot'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set nohlsearch

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

" save undo history in file
set undofile
set undodir=~/.cache/vim/undo

" Look for the file in the current directory,
" then south until you reach home.
"set tags=tags;~/
" add the tag file generated by ctag-bundler
set tags+=gems.tags

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

"set formatoptions=qrn1
" set colorcolumn=80
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%80v.*/
" augroup END

" insert a hash rocket with <c-l>
imap <C-r> <space>=><space>

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


" in terminal mode use ctrl-o to exit insert mode
tmap <C-o> <C-\><C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fast saving
nmap <leader>w :w!<cr>

" Close all the buffers
map <leader>ba :%bd!<cr>

" Regenerate ctags
map <leader>c :! ctags --tag-relative -R --exclude=.git --links=no --languages=-javascript,sql<cr>
map <leader>C :! tagundle<cr>

" map leader-W to strip white space
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" map leader-H to convert to 1.9 hashs
nnoremap <leader>H :%s/:\(\w\+\)\(\s*\)=>\(\s*\)/\1: /gc<cr>
vnoremap <leader>H :s/:\(\w\+\)\(\s*\)=>\(\s*\)/\1: /gc<cr>

" map leader-G to convert to 1.8 hashs
nnoremap <leader>G :%s/\(\w\+\):\(\s\+\)/:\1 => /gc<cr>
vnoremap <leader>G :s/\(\w\+\):\(\s\+\)/:\1 => /gc<cr>

nnoremap <leader>B :BuffergatorOpen<cr>

" ri.vim remaps
let g:ri_no_mappings=1
nnoremap <leader>ri :call ri#OpenSearchPrompt(0)<cr> " horizontal split
nnoremap <leader>RI :call ri#OpenSearchPrompt(1)<cr> " vertical split
nnoremap <leader>RK :call ri#LookupNameUnderCursor()<cr> " keyword lookup

map <leader>gr :e config/routes.rb<cr>
map <leader>gg :e Gemfile<cr>

" Show the current routes in the split
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! bundle exec rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

map <leader>e :edit %%
" map <leader>v :view %%

" reselect the text that was just pasted
nnoremap <leader>v V`]

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Run this file
nmap <silent> <leader>T :w<cr>:TestNearest<CR>
nmap <silent> <leader>t :w<cr>:TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

nnoremap <leader>p :set paste!<cr>

nnoremap <leader>q gqip
nmap <leader>m :make<cr>:copen<cr>

" let g:ranger_map_keys = 0
" map <leader>r :Ranger<CR>

command! Docker let test#ruby#rspec#executable = 'docker-compose run '.fnamemodify(getcwd(), ':t').' bundle exec rspec'

" Close the current buffer
"map <leader>bd :bd<cr>

" if has("autocmd")
"   autocmd QuickFixCmdPost *grep* cwindow
"
"   augroup vimrcEx
"     autocmd!
"
"     " what does this do?
"     autocmd BufReadPost *
"       \ if line("'\"") > 0 && line("'\"") <= line("$") |
"       \   exe "normal g`\"" |
"       \ endif
"   augroup END
"
"   augroup vimrc-auto-mkdir
"     autocmd!
"     autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
"     function! s:auto_mkdir(dir, force)
"       if !isdirectory(a:dir) && (a:force || input("'".a:dir."' does not exist. Create? [y/N]") =~? '^y\%[es]$')
"         call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"       endif
"     endfunction
"   augroup END
"
"   augroup FTOptions
"     autocmd!
"
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     " Ruby
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     autocmd BufNewFile,BufRead Rakefile,*.rake,*.pill,Capfile,Gemfile,config.ru,Guardfile setfiletype ruby
"     autocmd BufNewFile,BufRead *.scss.erb setfiletype scss.eruby
"     autocmd BufNewFile,BufRead *.js.erb setfiletype javascript.eruby
"     autocmd BufNewFile,BufRead *.coffee.erb setfiletype coffeescript.eruby
"     autocmd BufNewFile,BufRead *.html.erb setfiletype html.eruby
"     " autocmd BufNewFile,BufRead *.ruby,*.html,*.css,*.js,*.scss,*.less setlocal ts=2 sts=2 sw=2 expandtab
"
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     " Other languages
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     autocmd BufNewFile,BufRead *.mustache set syntax=mustache
"     autocmd BufNewFile,BufRead *.ol setfiletype lisp
"     autocmd BufReadPost fugitive://* set bufhidden=delete
"     autocmd BufNewFile,BufRead *.md,*.markdown,README,*.txt set spell
"     autocmd BufNewFile,BufRead *.jst set syntax=eruby
"     autocmd BufNewFile,BufRead *.jst.tpl set syntax=jst
"     autocmd BufRead,BufNewFile *.wisp set ft=wisp
"     autocmd BufRead,BufNewFile *.es6 setfiletype javascript
"     autocmd FileType wisp call PareditInitBuffer()
"     " autocmd BufNewFile,BufRead *.go setlocal ts=2 sts=2 sw=2 noexpandtab
"     " autocmd BufNewFile,BufRead *.hs setlocal ts=2 sts=2 sw=2 expandtab
"     autocmd BufNewFile,BufRead *.cpp setlocal ts=2 sts=2 sw=2 noexpandtab
"
"     autocmd FileType markdown nmap <leader>m :%!kramdown --no-auto-ids<cr>
"     autocmd FileType markdown vmap <leader>m :!kramdown --no-auto-ids<cr>
"
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     " Omnifunc
"     """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     autocmd FileType ruby,eruby silent! setlocal omnifunc=rubycomplete#Complete
"     autocmd FileType javascript silent! setlocal omnifunc=javascriptcomplete#CompleteJS
"     autocmd FileType html silent! setlocal omnifunc=htmlcomplete#CompleteTags
"     autocmd FileType css,scss,less silent! setlocal omnifunc=csscomplete#CompleteCSS
"     autocmd FileType xml silent! setlocal omnifunc=xmlcomplete#CompleteTags
"
"     autocmd FileType javascript nmap <leader>j :%!js-beautify --type=js -j -p -q -B -s 2 -f -<cr>
"     autocmd FileType javascript vmap <leader>j  :!js-beautify --type=js -j -p -q -B -s 2 -f -<cr>
"     autocmd FileType css,scss,less nmap <leader>j :%!js-beautify --type=css -j -q -p -B -s 2 -f -<cr>
"     autocmd FileType css,scss,less vmap <leader>j  :!js-beautify --type=css -j -q -p -B -s 2 -f -<cr>
"     autocmd FileType html,eruby nmap <leader>j :%!js-beautify --type=html -j -p -q -B -s 2 -f -<cr>
"     autocmd FileType html,eruby vmap <leader>j  :!js-beautify --type=html -j -p -q -B -s 2 -f -<cr>
"     autocmd FileType ruby nnoremap <leader>l :Errors<cr>
"
"     " autocmd FileType go nmap <leader>r <Plug>(go-run)
"     " autocmd FileType go nmap <leader>b <Plug>(go-build)
"     autocmd FileType go nmap <leader>t <Plug>(go-test)
"     " autocmd FileType go nmap <leader>c <Plug>(go-coverage)
"
"     autocmd FileType octave nmap <leader>t maggOpkg load all<esc>Gopause<esc>:w<cr>:!octave -qf %<cr>ddggdd:w<cr>`a
"
"     autocmd FileType haskell nnoremap <buffer> <leader>j :%!stylish-haskell<cr>
"   augroup END
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set background=dark
" set encoding=utf-8
" set t_Co=16

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map for ack
" let g:ackprg="ack-grep -H --nocolor --nogroup --column"
" nnoremap <leader>a :Ack
nnoremap <leader>s :Grepper -tool git<cr>
" nnoremap <leader>v :TagbarToggle<cr>

" let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
" let g:syntastic_mode_map = { 'mode': 'passive',
"       \ 'active_filetypes': ['ruby', 'javascript', 'css', 'hmtl', 'scss', 'less', 'c', 'h', 'go', 'haskell'],
"       \ 'passive_filetypes': [] }
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_ruby_checkers=['rubylint', 'rubocop', 'mri']
" let g:syntastic_aggregate_errors=1
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_jump=0
" let g:syntastic_auto_loc_list=0

let g:airline_theme = "solarized"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = " "
let g:airline#extensions#tabline#left_alt_sep = "|"

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|vendor\/bundle$\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }

let test#strategy = 'neovim'
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display after bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme NeoSolarized
let g:neosolarized_contrast = "normal"
let g:neosolarized_visibility = "normal"
let g:neosolarized_vertSplitBgTrans = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0
