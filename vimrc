set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set autoindent
set smartindent

set clipboard=unnamed

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


call plug#begin('~/.vim/plugged')
Plug 'mhartington/oceanic-next'
Plug 'vim-ruby/vim-ruby'
Plug 'msanders/snipmate.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/BufClose.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/rubycomplete.vim'
Plug 'ervandew/supertab'
Plug 'vim-scripts/vim-coffee-script'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/Pydiction'
Plug 'vim-scripts/python.vim'
Plug 'vim-scripts/pydoc.vim'
Plug 'nanki/treetop.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/yajs.vim'
Plug 'mhartington/oceanic-next'
"Plug 'wincent/Command-T'
Plug 'kien/ctrlp.vim'
call plug#end()


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
imap jj <ESC>

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

let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_max_height = 100
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" if executable('ack')
"   let g:ctrlp_user_command = 'ack %s -l ""'
" endif
" if executable('ag')
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif
"map <leader>f :CtrlP pwd<cr>
map <leader>f :CtrlP<cr>
map <leader>F :CtrlPCurFile<cr>

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

if has('autocmd')
  " Source .vimrc when I write it.  The nested keyword allows
  " autocommand ColorScheme to fire when sourcing ~/.vimrc.
  au! BufWritePost vimrc nested source %
  au! BufWritePost .vimrc nested source %

  " Strip whitespaces at end of line for the following file types
  autocmd FileType c,cpp,java,php,ruby,python,haml,coffee,js autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
endif

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

"set rubydll=~/.rvm/rubies/ruby-2.7.1/lib/libruby.2.7.dylib
"set luadll=/usr/local/Cellar/lua52/5.2.1/lib/liblua.dylib

" Theme
 syntax enable
" for vim 7
 set t_Co=256

" for vim 8
 if (has("termguicolors"))
  set termguicolors
 endif

colorscheme OceanicNext
