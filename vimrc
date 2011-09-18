call pathogen#infect()
set nocompatible
set tabstop=3
set shiftwidth=3
set softtabstop=3
set ai
set nu
set ruler
set hidden
set history=100
set wildmenu
set wildmode=list:longest
set showmatch "show matching braces

" ignore caps for search unless there is one
set ignorecase
set smartcase

" highlight search term
set hlsearch
set incsearch

set title
set backspace=indent,eol,start

set visualbell
set autoread

" syntax highlighting
syntax on
filetype on
filetype plugin on
filetype indent on

noremap ' `
noremap ` '

" This is useful for debugging
" set verbose=9

" key mapping
map <F2> :NERDTreeToggle<CR>

