call plug#begin('~/.vim/plugged')

Plug 'ternjs/tern_for_vim'

Plug 'sickill/vim-monokai'

Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)

" Plug options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plug outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'kchmck/vim-coffee-script'
Plug 'flowtype/vim-flow'

Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'blueyed/vim-diminactive'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'wavded/vim-stylus'
Plug 'stylus/stylus'
Plug 'iamcco/markdown-preview.vim'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'

Plug 'mattn/emmet-vim', { 'for': 'html' }

Plug 'tomlion/vim-solidity'

Plug 'cakebaker/scss-syntax.vim'

Plug 'jwalton512/vim-blade'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manually Turn on Feature
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * EnableStripWhitespaceOnSave


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

set foldmethod=syntax
filetype on

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
" Always show the status line
set laststatus=2
set statusline=%f
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

set rtp+=/usr/local/opt/fzf

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable line numbers
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.DS_Store']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

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
" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'yarn lint --'
let g:jsx_ext_required = 0
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:prettier#exec_cmd_path='/usr/local/bin/prettier'
let g:prettier#autoformat = 0
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#parser = 'babylon'

autocmd BufWritePre *.py,*.js,*.json,*.scss,*.css,*.jsx,*.graphql Prettier

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SCSS-syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.scss set filetype=scss.css

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Blade-syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade " Fix blade auto indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion = 1

