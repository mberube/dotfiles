call pathogen#infect() " pathogen to have clean plugins
call pathogen#helptags()

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

" code formatting on F5
map  <silent> <F5> mmgg=G'm^

" easier window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>tn :tabnew<cr>
map <leader>m :MRU<cr>

" double percent sign in command mode is expanded
" to directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

" indent with one key
nmap > >>
nmap < <<

" remove trailing whitespaces for certain file types
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,haml autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

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
let g:pydiction_location='~/.vim/bundle/Pydiction.git/complete-dict'


" completion with ctrl-space (gui only, problem with console?)
if has("gui_running")
  inoremap <C-space> <C-X><C-O>
else
  if has("unix")
    " C-space is \0 in linux
    inoremap <Nul> <C-X><C-O>
  endif
end

set nobackup
set nowritebackup
set noswapfile

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
