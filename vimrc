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
      \   'readonly': '%{&readonly?"READ ONLY":""}'
      \ },
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             [ 'fugitive', 'readonly', 'filename', 'modified', 'syntastic' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ }
function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" Coq interaction
Plugin 'def-lkb/vimbufsync'
Plugin 'trefis/coquille'

Plugin 'idris-hackers/idris-vim'

Plugin 'rust-lang/rust.vim'
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'jremmen/vim-ripgrep'

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

let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']

let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_check_on_open = 0

" Set F2 as the binding to toggle the paste mode
set pastetoggle=<F2>

" Use F3 to toggle spelling
nnoremap <F3> :set spell!<CR>

" Use F4 to syntax check
nnoremap <F4> :SyntasticCheck<CR>

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

let g:rustfmt_autosave = 1

let g:ycm_path_to_python_interpreter="/usr/bin/python"
let g:ycm_auto_trigger=0
nnoremap <Leader>a :let g:ycm_auto_trigger=1<Cr>
nnoremap <Leader>A :let g:ycm_auto_trigger=0<Cr>

