set nocompatible

let mapleader      = ";"
let maplocalleader = ";"

" OS Detection
if has('win32') || has('win64')
let $OS = 'windows'
let $VIMHOME = $HOME. '/vim'
else
let $OS = 'linux'
let $VIMHOME = $HOME . '/.vim'
endif

" Setup bundles
filetype off

set rtp+=$VIMHOME/bundle/Vundle.vim
call vundle#begin($VIMHOME . '/bundle')

" Vundle
Plugin 'gmarik/vundle'

" External packages
Plugin 'tpope/vim-markdown'

" Quick Task
Plugin 'aaronbieber/quicktask'
let g:quicktask_snip_path = $VIMHOME . '/snips/'
let g:quicktask_snip_default_filetype = 'markdown'

Plugin 'tpope/vim-fugitive'
Plugin 'ciaranm/inkpot'

" Haskell Indenting
Plugin 'elliottt/haskell-indent'

" NERDTree config
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
if $OS != 'windows'
    let NERDTreeQuitOnOpen = 1
endif

" lightline.vim config
Plugin 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}'
      \ } }
if $OS != 'windows'
"    let g:lightline['separator']    =  { 'left': '⮀', 'right': '⮂' }
"    let g:lightline['subseparator'] =  { 'left': '⮁', 'right': '⮃' }
endif

" Coq interaction
Plugin 'def-lkb/vimbufsync'
Plugin 'trefis/coquille'
" Ack plugin
Plugin 'mileszs/ack.vim'

Plugin 'idris-hackers/idris-vim'

Plugin 'wting/rust.vim'
Plugin 'cauterize-tools/vim-cauterize'
Plugin 'pchickey/vim-gidl'
Plugin 'fidian/hexmode'

Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'

call vundle#end()

" Enable filetype detection
filetype plugin indent on

" got these from the stephen deil article. not sure about them all
set smartcase
set smarttab
set smartindent
set autoindent
set mouse=a
set history=1000
set completeopt=menuone,menu,longest

" Allow backspacing over everything
set backspace=indent,eol,start

" Incremental searching
set incsearch

" Extended matching with %
runtime macros/matchit.vim

" Set the terminal title
set title

" Cursor context
set scrolloff=3

" Allow \ \ to kill the search highlighting.
nnoremap <Leader><Leader> :noh<Enter>

" Always show cursor position
set ruler

" Fold by manually defined folds
set foldenable
set foldmethod=marker

" Syntax
if &t_Co > 2 || has("gui_running")
    syntax enable
    set hlsearch
endif

" Spell checking
if has("spell")
    setlocal spell spelllang=en_us
    set nospell
endif

" Highlight lines longer than 80 chars
let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Wrap the line at 80 characters
set textwidth=80

" Highlight trailing space, and tab characters, toggle with <leader>-s
set list lcs=tab:>-,trail:.
nnoremap <leader>s :set nolist!<CR>


" Tab navigation
nnoremap <C-n> gt
nnoremap <C-p> gT

" Disable the help key
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

" Print options
set printoptions=paper:letter

" Completion options
set wildmode=longest:full,list:full
set wildmenu
set wildignore=*.o,*.hi,*.swp,*.bc
set wildignore+=*\\tmp\\*,*.swo*,*.zip,.git,.cabal-sandbox,.stack-work

" Colors!
colors default
set bg=dark

" Disable the arrow keys when in edit mode
" inoremap <Up>    <NOP>
" inoremap <Right> <NOP>
" inoremap <Down>  <NOP>
" inoremap <Left>  <NOP>

inoremap jk <Esc>

" Set F2 as the binding to toggle the paste mode
set pastetoggle=<F2>

" Use F3 to toggle spelling
nnoremap <F3> :set spell!<CR>

" Disable the bell
set noerrorbells
set visualbell
set t_vb=

" Map <Leader>s to sort the visual selection
vnoremap <Leader>s :sort<Cr>

" Case altering
nnoremap <Leader>U vawgU
nnoremap <Leader>u vawgu

" supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif


