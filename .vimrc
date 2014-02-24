execute pathogen#incubate()
execute pathogen#helptags()
syntax on
filetype plugin indent on


let mapleader = ","
let maplocalleader = ","

nnoremap <Esc><Esc> :w<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <C-m> :NERDTreeFocus<CR>



inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-h> <left>
inoremap <C-l> <right>


nnoremap <silent> <C-q> :q<CR>

" hi TabLineSel term=standout ctermfg=White ctermbg=Yellow guifg=Black guibg=Yellow
" let TabLineSel:ctermfg=White
nnoremap <silent> <leader>t :tabnew<CR>
nnoremap <silent> <leader>w :tabclose<CR>
nnoremap <silent> <leader>d :tabn<CR>
noremap <silent> <leader>a :tabp<CR>
nnoremap <silent> <Esc> :let @/=""<CR>

set nocompatible
set ignorecase
set smartcase
set hlsearch
set showcmd
set wildmenu
set incsearch
set ruler
set showmatch
set autowrite
set cindent
set switchbuf=useopen,usetab,newtab

" Mouse support for 
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
set mouse=a

try
	colorscheme koehler
catch
	try
		colorscheme evening
	catch
	endtry
endtry

"special characters display
set listchars=tab:>-,eol:<,nbsp:%,trail:.
nnoremap <C-o> :set list!<CR>
nnoremap <C-p> :set hlsearch!<CR>
noremap <C-i> :set number!<CR>


" Makefile building
"map <F7> :w<CR>:make<CR>
map <leader>b :make!<CR>
"map <C-t> :copen<CR>

" Bash scripts
map <F6> :w<CR> :!bash %<CR>

" " Vim scripting
map <C-R> :source ~/.vimrc<CR>

function! GetBufferList()
	redir =>buflist
	silent! ls
	redir END
	return buflist
endfunction

function! ToggleList(bufname, pfx)
	let buflist = GetBufferList()
	for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
		if bufwinnr(bufnum) != -1
			exec(a:pfx.'close')
			return
		endif
	endfor
	if a:pfx == 'l' && len(getloclist(0)) == 0
		echohl ErrorMsg
		echo "Location List is Empty."
		return
	endif
	let winnr = winnr()
	exec(a:pfx.'open')
	if winnr() != winnr
		wincmd p
	endif
endfunction

map <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
map <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>


" function! GuiTabLabel()
" 	return fnamemodify(bufname(winbufnr(1)), ":t")
" endfunction
" set guitablabel=hahaha
" autocmd BufEnter * let &titlestring = expand("%:@")
" set title

" Ctrl-p search caching
let g:ctrlp_show_hidden = 1

" syntastic
nnoremap <leader>s :SyntasticCheck<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_cpp_compiler_options = ' -std=c++0x'
