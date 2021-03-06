" General Configuration"{{{
colorscheme murphy
set number
set nocompatible 
set encoding=utf-8
set history=256			      "Number of things to remember in history"
set timeoutlen=250		    "Time to wait after ESC (default has an annoying delay"
set clipboard+=unamed	    "Yanks go on clipboard instead"
set pastetoggle=<f10>	    "toggle between paste and normal: for 'safer' pasting
set shiftround            "round indent to multiple of 'shiftwidth'
set tags=.git/tags;$HOME  "consider the repo tags first, then walk dir tree upto $HOME looking for tags note ';' sets the stop folder. :h file-search
set modeline
set modelines=5	          "default number of lines to read for modeline instructions
set autowrite	            " Writes on make/shell commands
set autoread

set nobackup
set nowritebackup
set directory=/tmp//      " prepend(^=) $HOME/.tmp to default path; use full path  backup filename (//)
set noswapfile
set hidden                " The current buffer can be put to the background without writing to disk.

set hlsearch
set ignorecase
set smartcase
set incsearch

let g:is_posix=1
let mapleader=','
let maplocalleader='	'
let g:netrw_banner=0
" "}}}

" Formatting "{{{
set fo+=o
set fo-=r
set fo-=t

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set backspace=indent
set backspace+=eol
set backspace+=start

set autoindent
set cindent
set indentkeys-=0#
set cinkeys-=0#
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do
set cinwords+=for,switch,case
" "}}}


"  Visual "{{{
syntax on
set mouse=a
set mousehide

set showmatch
set matchtime=2
set wildmode=longest,list
set completeopt+=preview
set novisualbell
set noerrorbells
set vb t_vb=


set laststatus=2
set shortmess=atI
set showcmd

set statusline=%<%f\
set stl+=[%{&ff}]
set stl+=%y%m%r%=
set stl+=%-14.(%l,%c%V%)\ %P

set foldenable
set foldmethod=marker
set foldlevel=100

set foldopen=block,hor,tag
set foldopen+=percent,mark
set foldopen+=quickfix
set virtualedit=block

set splitbelow
set splitright

set list
" display unprintable characters f12 - switches
set listchars=tab:\ ·,eol:¬
set listchars+=trail:·
set listchars+=extends:»,precedes:«
map <silent> <F12> :set invlist<CR>

" Key mappings " {{{
" Duplication
nnoremap <leader>c mz"dyy"dp`z
vnoremap <leader>c "dymz"dP`z

nnoremap <leader>rs :source ~/.vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>re :e ~/.vim/vimrc<CR>
nnoremap <leader>rd :e ~/.vim/ <CR>
nnoremap <leader>rc :silent ! cd ~/.vim/ && git commit ~/.vim/vimrc -v <CR>

" Tabs
nnoremap <M-h> :tabprev<CR>
nnoremap <M-l> :tabnext<CR>

" Buffers
nnoremap <localleader>- :bd<CR>
nnoremap <localleader>-- :bd!<CR>
" Split line(opposite to S-J joining line)
nnoremap <C-J> gEa<CR><ESC>ew

map <silent> <C-W>v :vnew<CR>
map <silent> <C-W>s :snew<CR>

" copy filename
map <silent> <leader>. :let @+=expand('%:p').':'.line('.')<CR>
map <silent> <leader>/ :let @+=expand('%:p:h')<CR>
"copy path
"
map <S-CR> A<CR><ESC>
"
"Nerd Tree Toggle
map <leader>e :NERDTreeToggle<CR>

" Make control direction switch between windows like C-W h, etc
nmap <silent> <C-k> <C-W><C-k>
nmap <silent> <C-j> <C-W><C-j>
nmap <silent> <C-h> <C-W><C-h>
nmap <silent> <C-l> <C-W><C-l>

  " vertical paragraph-movement
nmap <C-K> {
nmap <C-J> }

"vertical split with Command-T
nnoremap <leader>v :exec ':vnew \| CommandT'<CR>
" and without
nnoremap <leader>V :vnew<CR>

" when pasting copy pasted text back to buffer instead replacing with override
xnoremap p pgvy

" copy whole line
nnoremap <silent> <D-c> yy

" close/delete buffer when closing window
map <silent> <D-w> :bdelete<CR>


" Control+S and Control+Q are flow-control characters: disable them in your
" terminal settings.
" $ stty -ixon -ixoff
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

"
"" generate HTML version current buffer using current color scheme
map <leader>2h :runtime! syntax/2html.vim<CR>

" " }}}

" Scripts and Plugins" {{{
filetype off

"set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugins/')

"Vundle managing vundle!
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

"

call vundle#end()
filetype plugin indent on
"}}}
