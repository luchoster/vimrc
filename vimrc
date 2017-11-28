set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'blueyed/vim-diminactive'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'ntpeters/vim-better-whitespace'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programming Language Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'jdkanani/vim-material-theme'
Plugin 'sickill/vim-monokai'

call vundle#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manually Turn on Feature
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * EnableStripWhitespaceOnSave


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

nmap <leader>s :Ag

nmap ,a= :Tabularize /=<CR>
vmap ,a= :Tabularize /=<CR>
nmap ,a: :Tabularize /^[^:]*\zs:<CR>
vmap ,a: :Tabularize /:<CR>
nmap ,aa :Tabularize /\CAS<CR>
nmap ,ff :Tabularize /from<CR>
nmap ,afr :Tabularize /=><CR>
vmap ,afr :Tabularize /=><CR>
nmap ,atr :Tabularize /-><CR>
vmap ,atr :Tabularize /-><CR>
nmap ,agg :Tabularize /:=<CR>
vmap ,agg :Tabularize /:=<CR>


set number
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set cc=80
set autoread
set ai
set si
set wrap
set relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

if has("gui_macvim")
  set termguicolors
  colorscheme monokai
else
  colorscheme monokai
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""
" => CoffeeScript section
""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
  setl foldmethod=indent
  setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()


""""""""""""""""""""""""""""""
" => JavaScript section
""""""""""""""""""""""""""""""

au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH<esc>FP2xi

function! JavaScriptFold()
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
let g:syntastic_javascript_checkers = ['eslint']
let g:jsx_ext_required = 0

" Go
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
  let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee','.coffee.\1.js', '')
  execute "tabedit " . l:filename
  execute "SyntasticCheck"
  execute "Errors"
endfunc
nnoremap <silent> <leader>c :call SyntasticCheckCoffeescript()<cr>

