set cindent

set tabstop=4
set expandtab
set shiftwidth=4

" let w:m80=matchadd('ErrorMsg', '\%>80v.\+', -1)

set textwidth=80

if has("cscope")
    nnoremap <buffer> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
endif

" Insert a separating line
nnoremap <buffer> --l ^i/* <Esc>76a*<Esc>A/<Esc>F lR

" Insert a system include
nnoremap <localleader>i O#include <><Esc>i
nnoremap <localleader>I O#include ""<Esc>i
