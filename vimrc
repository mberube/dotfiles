call pathogen#infect() " pathogen to have clean plugins

set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set smartindent

set number
set ruler
set hidden
set history=100
set wildmenu
set wildmode=list:longest
set mouse=a " enabled to use the mouse in xterm
set expandtab


set ignorecase " ignore caps for search unless there is one
set smartcase
set hlsearch " highlight search term
set incsearch " incremental search
set showmatch " show matching braces
set gdefault " adds the /g flag on substitutions (:s)

set title
set backspace=indent,eol,start

set visualbell
set autoread " automatically reload files if they changed

" syntax highlighting
syntax on
filetype on
filetype plugin on
filetype indent on

" change leader
let mapleader=','

noremap ' `
noremap ` '
noremap ; :

" This is useful for debugging
" set verbose=9

" key mapping
map <F2> :NERDTreeToggle<CR>

" easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>tn :tabnew<cr>
map <leader>f :MRU<cr>

" indent with one key
nmap > >>
nmap < <<


" hide toolbar in gui mode
if has("gui_running")
	set go-=T
end

set wildmenu
set wildmode=list:longest,full

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1


" completion with ctrl-space (gui only, problem with console?)
if has("gui_running")
	inoremap <C-space> <C-X><C-O>
else 
	if has("unix")
		" C-space is \0 in linux
		inoremap <Nul> <C-X><C-O>
	endif
end

" set persistent undo
try
    if IsWindows()
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim_runtime/undodir
    endif

    set undofile
catch
endtry


function! IsWindows()
  return (has("win32") || has("win64") || has("win95"))
endfunction
