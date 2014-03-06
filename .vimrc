execute pathogen#incubate()
execute pathogen#helptags()
syntax on
filetype plugin indent on



let mapleader = ","
let maplocalleader = ","

nnoremap <Esc><Esc> :w<CR>
nnoremap <C-n> :NERDTreeTabsToggle<CR>
"nnoremap <C-m> :NERDTreeTabsFocus<CR>


nnoremap Y y$
inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-h> <left>
inoremap <C-l> <right>


nnoremap <silent> <C-q> :q<CR>

" hi TabLineSel term=standout ctermfg=White ctermbg=Yellow guifg=Black guibg=Yellow
" let TabLineSel:ctermfg=White
" nnoremap <silent> <leader>t :tabnew<CR>
" nnoremap <silent> <leader>w :tabclose<CR>
nnoremap <silent> <leader>d :tabn<CR>
noremap <silent> <leader>a :tabp<CR>
nnoremap <silent> <Esc> :let @/=""<CR>

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
set autowrite
set cindent
set switchbuf=split,useopen,usetab,newtab
set number
set noautochdir
set hidden
set wildignore=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm

" Mouse support for 
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
set mouse=a

try
	colorscheme mustang
catch
	try
		colorscheme desert256
	catch
	try
		colorscheme koehler
		catch
			try
				colorscheme evening
			catch
			endtry
		endtry
	endtry
endtry

"special characters display
set listchars=tab:>-,eol:<,nbsp:%,trail:.
nnoremap <silent> <leader>h :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar>syntax enable <Bar> endif<CR>
nnoremap <silent> <leader>j :set wrap!<CR>
nnoremap <silent> <leader>o :set list!<CR>
nnoremap <silent> <leader>p :set hlsearch!<CR>
noremap <silent> <leader>i :set number!<CR>


" Makefile building
map <F7> :w<CR>:make!<CR>
"map <leader>b :make!<CR>
"map <C-t> :copen<CR>

" Bash scripts
map <F6> :w<CR> :!bash %<CR>

" " Vim scripting
" map <C-R> :source ~/.vimrc<CR>

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

	exec(a:pfx.'open')
	if winnr() != winnr
		wincmd p
	endif
endfunction

map <silent> <leader>1 :call ToggleList("Location List", 'l')<CR>
map <silent> <leader>2 :call ToggleList("Quickfix List", 'c')<CR>


" Search completion with grep
" nmap <C-F> :noautocmd vimgrep input("Enter search pattern\n") *<CR>
nmap <C-F> :call Vimgrep_Input()<CR>

let user_inputsearchfilter = '**/*.cpp'
function! Vimgrep_Input()
	call inputsave()
	let userinput = input("Enter your search pattern\n")
	call inputrestore()
	" silent noautocmd exe 'lvimgrep /' . userinput . '/jg **/*'
	silent noautocmd exe 'vimgrep /' . userinput . '/jPP **/*.cpp **/*.h'
	copen 15
	" match Search '/' + userinput +'/'
endfunction


" function! GuiTabLabel()
" 	return fnamemodify(bufname(winbufnr(1)), ":t")
" endfunction
" set guitablabel=hahaha
" autocmd BufEnter * let &titlestring = expand("%:@")
" set title

" Ctrl-p search caching
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
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

" syntastic
nnoremap <leader>s :SyntasticCheck<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_cpp_compiler_options = ' -std=c++0x'
let g:syntastic_mode_map = { 'mode': 'passive',
			\ 'active_filetypes': [],
			\ 'passive_filetypes': [] }


" General autocomplete helpers
hi Pmenu ctermbg=3 ctermfg=White
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <expr> <CR> pumvisible() ? ("\<C-y>") : "\<C-g>u\<CR>"
set completeopt=longest,menuone
set conceallevel=2
set concealcursor=inv

" ctags
set tags+=~/.vim/tags
" au BufWritePost  *.c,*.cpp,*.h silent! !ctags -R &

" clang_complete
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1
" let g:clang_use_library = 0
let g:clang_auto_select = 1
let g:clang_snippets=1
let g:clang_snippets_engine = "clang_complete"
let g:clang_conceal_snippets = 1
let g:clang_complete_snippets = 1


" let g:clang_library_path = '/usr/lib'
set completefunc=ClangComplete
