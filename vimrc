set nocompatible

set encoding=utf-8

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

set rtp+=$VIMHOME/bundle/vundle
call vundle#begin($VIMHOME . '/bundle')

" Vundle
Plugin 'gmarik/vundle'

" External packages
Plugin 'tpope/vim-markdown'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
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
      \   'readonly': '%{&readonly?"READ ONLY":""}'
      \ },
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \ },
      \ }
function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

Plugin 'rust-lang/rust.vim'
Plugin 'cauterize-tools/vim-cauterize'
Plugin 'pchickey/vim-gidl'
Plugin 'fidian/hexmode'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jremmen/vim-ripgrep'
Plugin 'rhysd/vim-wasm'

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

set hidden
let g:racer_cmd = "/Users/pat/.cargo/bin/racer"

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

let g:rustfmt_autosave = 0

