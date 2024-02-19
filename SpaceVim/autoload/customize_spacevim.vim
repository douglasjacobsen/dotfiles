function! customize_spacevim#after() abort
  set mouse=
  unmap <C-Left>
  unmap <C-Right>
  unmap <C-Up>
  unmap <C-Down>
  set completeopt+=longest
  set completeopt-=menu
  set nowic
  set wildmode=longest,list
endfunction
