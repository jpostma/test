execute pathogen#interpose('bundle/{}')
execute pathogen#helptags()

" execute pathogen#infect()
syntax on
if has("autocmd")
    filetype indent on
    filetype plugin indent on
endif


let mapleader = ","
let maplocalleader = ","


" Move by screen line instead of logical line
map j gj
map k gk


nnoremap <silent> <C-q> :q<CR>

" hi TabLineSel term=standout ctermfg=White ctermbg=Yellow guifg=Black guibg=Yellow
" let TabLineSel:ctermfg=White
" nnoremap <silent> <leader>t :tabnew<CR>
" nnoremap <silent> <leader>w :tabclose<CR>
nnoremap <silent> <Esc> :let @/=""<CR>
nnoremap  <leader>cd :cd %:p:h<CR>

set cindent
"set autoindent
set ts=4
set shiftwidth=4
set nocompatible
set ignorecase
set smartcase
set hlsearch
set showcmd
set wildmenu
set wildmode=longest:full,full
set incsearch
set ruler
set showmatch
set matchtime=2
set autowrite
set switchbuf=split,useopen,usetab
set number
set noautochdir
set hidden
set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*.o,tags        " Linux/MacOSX
set lazyredraw
set history=500
set scrolloff=7
set foldmethod=syntax
set nobackup
set noswapfile

if has("autocmd")
	" Automatically unfold everything when opening a file
	autocmd BufRead * normal zR

	autocmd filetype python setlocal expandtab
	autocmd filetype cs setlocal cindent
endif

if has("gui_running") 
	set guifont=Consolas:h10
	set lines=99999 columns=99999
else
	set t_Co=256
endif
set backspace=indent,eol,start
"behave mswin

" Mouse support for 
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
set mouse=a

try
		colorscheme skittles_berry
catch
	try
		colorscheme mustang
	catch
		try
			colorscheme desert256
		catch
		endtr
	endtry
endtry

"special characters display
set listchars=tab:>-,eol:<,nbsp:%,trail:-
nnoremap <silent> <leader>h :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar>syntax enable <Bar> endif<CR>
nnoremap <silent> <leader>j :set wrap! wrap?<CR>
nnoremap <silent> <leader>o :set list! list?<CR>
nnoremap <silent> <leader>p :set hlsearch! hlsearch?<CR>
noremap <silent> <leader>i :set number! number?<CR>


" Makefile building
set makeprg=make\ CXX=\"$HOME\/.vim/bin\/cc_args.py\ g++\"\ CCC=\"$HOME\/.vim/bin\/cc_args.py\ gcc\"
			\
"Not sure for windows!!!!!?
map <C-b> :wa<CR>:make!<CR>
"
" Bash scripts
map <F6> :wa<CR> :!"%:p"<CR>

" " Vim scripting
nmap <silent> <leader>sv  :source $MYVIMRC<CR>
nmap <silent> <leader>ev  :e $MYVIMRC<CR>

hi StatusLine   ctermfg=15  "ctermbg=239
hi StatusLineNC ctermfg=249 ctermbg=237

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

	exec('botright '.a:pfx.'open')
	if winnr() != winnr
		wincmd p
	endif
endfunction

map <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
map <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>


" Search completion with grep
" nmap <C-F> :noautocmd vimgrep input("Enter search pattern\n") *<CR>
nnoremap <leader>k :call Vimgrep_Input()<CR>
nnoremap <leader>K :silent exe 'vimgrep /' . expand("<cword>"). '/jPP **/*.cpp **/*.c **/*.h'<CR>

let user_inputsearchfilter = '**/*.cpp'
function! Vimgrep_Input()
	call inputsave()
	let userinput = input("Enter your search pattern\n")
	call inputrestore()
	" silent noautocmd exe 'lvimgrep /' . userinput . '/jg **/*'
	silent exe 'vimgrep /' . userinput . '/jPP **/*.cpp **/*.c **/*.h'
	copen 15
endfunction


" Minibuf explorer
nnoremap <Leader>4 :MBEbn<cr>
nnoremap <Leader>3 :MBEbp<cr>
let g:miniBufExplAutoStart = 1
let g:miniBufExplorerAutoStart = 1


" Ctrl-p search caching
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_max_history = 0
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

"EasyMotion
map <Leader> <Plug>(easymotion-prefix)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen


" General autocomplete helpers
hi Pmenu ctermbg=3 ctermfg=White
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <CR> pumvisible() ? ("\<C-y>") : "\<C-g>u\<CR>"
set completeopt=longest,menuone
set conceallevel=2
set concealcursor=inv
"set path+=/usr/include
"set path+=/usr/include/c++/4.6
"set path+=$PWD/**

" ctags
set tags+=~/.vim/tags
" au BufWritePost  *.c,*.cpp,*.h silent! !ctags -R &

" Differation keybinding
let g:whitespace_diff=1
nnoremap <silent> <Leader>df :call DiffToggle()<CR>
nnoremap <silent> <Leader>dw :call WhiteDiffToggle()<CR>

" Define a function called DiffToggle.
function! DiffToggle()
	if &diff
		echo "Diff off"
		diffoff
	else
		echo "Diff on"
		diffthis
	endif
endfunction

function! WhiteDiffToggle()
	if g:whitespace_diff
		echo "Diff off"
		let g:whitespace_diff=0
		set diffopt+=iwhite
	else
		echo "Diff on"
		let g:whitespace_diff=1
		set diffopt-=iwhite
	endif
endfunction

source $HOME/vimrc_common

if has('win32')
  " Avoid mswin.vim making Ctrl-v act as paste
  source $VIMRUNTIME/mswin.vim
  nnoremap <C-V> <C-V>
  nnoremap <C-Y> <C-Y>
endif

"Tab navigation
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-tab> :tabnext<CR>
nnoremap <silent> <C-S-tab> :tabprevious<CR>
nnoremap <silent> <leader>d :tabn<CR>
noremap <silent> <leader>a :tabp<CR>
