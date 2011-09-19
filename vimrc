call pathogen#infect() " pathogen to have clean plugins

set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set ai
set nu
set ruler
set hidden
set history=100
set wildmenu
set wildmode=list:longest
set showmatch "show matching braces
set mouse=a " enabled to use the mouse in xterm

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

" hide toolbar in gui mode
if has("gui_running")
	set go-=T
end

set wildmenu
set wildmode=list:longest,full

" completion with ctrl-space (gui only, problem with console?)
if has("gui_running")
	inoremap <C-space> <C-X><C-O>
else 
	if has("unix")
		" C-space is \0 in linux
		inoremap <Nul> <C-X><C-O>
	endif
end
