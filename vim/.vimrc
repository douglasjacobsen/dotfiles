"vim: foldmethod=marker

source ~/.vimrc.bundles

" Setup
filetype plugin on

" Fugitive {{{
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Glog<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
	nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
	nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}}}

" UndoTree {{{
	nnoremap <Leader>u :UndotreeToggle<CR>
	" If undotree is opened, it is likely one wants to interact with it.
	let g:undotree_SetFocusWhenToggle=1
" }}}

" UnBundle {{{
	function! UnBundle(arg, ...)
		let bundle = vundle#config#init_bundle(a:arg, a:000)
		call filter(g:bundles, 'v:val["name_spec"] != "' . a:arg . '"')
	endfunction

	com! -nargs=+ UnBundle
		\ call UnBundle(<args>)
" }}}

" Initialize NERDTree as needed {{{
	function! NERDTreeInitAsNeeded()
		redir => bufoutput
		buffers!
		redir END
		let idx = stridx(bufoutput, "NERD_tree")
		if idx > -1
			NERDTreeMirror
			NERDTreeFind
			wincmd l
		endif
	endfunction
" }}}

" Status Line {{{
	" jamessan's
	set statusline=   " clear the statusline for when vimrc is reloaded
	set statusline+=%-3.3n\                      " buffer number
	set statusline+=%f\                          " file name
	set statusline+=%h%m%r%w                     " flags
	set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
	set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
	set statusline+=%{&fileformat}]              " file format
	set statusline+=%{fugitive#statusline()}	 " Git Branch name
	set statusline+=%=                           " right align
	set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
	set statusline+=%b,0x%-8B\                   " current char
	set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
" }}}

execute pathogen#infect('local/{}')

let fortran_free_source=1
let mapleader=','
autocmd FileType fortran setlocal textwidth=0
autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

set wildmode=longest:full
set wildmenu
set pastetoggle=<F3>

nnoremap <F4> "=strftime("%x")<CR>P
inoremap <F4> <C-R>=strftime("%x")<CR>

set laststatus=2

"Vundle mappings
nnoremap <leader>bc :BundleClean<CR>
nnoremap <leader>bi :BundleInstall<CR>

" Fugitive mappings (git plugin)
nnoremap <leader>gl :Glog --graph --oneline --abbrev-commit --decorate<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gb :Gblame<CR>

" Git gutter mappings (git diff plugin)
nnoremap <leader>ggt :GitGutterToggle<CR>
nnoremap <leader>ggl :GitGutterLineHighlightsToggle<CR>

" LineDiff mappings
nnoremap <leader>ld :LineDiff<CR>

set autoindent
set number
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set modeline
set modelines=5
set foldmethod=marker
set hlsearch
set ignorecase

colo peachpuff
