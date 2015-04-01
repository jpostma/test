execute pathogen#interpose('bundle/{}')
execute pathogen#helptags()

source $HOME/vimrc_common

" Mouse support for 
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
"


" Makefile building
set makeprg=make\ CXX=\"$HOME\/.vim/bin\/cc_args.py\ g++\"\ CCC=\"$HOME\/.vim/bin\/cc_args.py\ gcc\"
			\
map <C-b> :wa<CR>:make!<CR>
"map <leader>b :make!<CR>
"map <C-t> :copen<CR>

" Bash scripts
map <F6> :w<CR> :!bash %<CR>


hi StatusLine   ctermfg=15  "ctermbg=239
hi StatusLineNC ctermfg=249 ctermbg=237



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



"Conque(GDB) mapping
nnoremap <leader>zsh :ConqueTermSplit zsh<cr>
nnoremap <leader>bash :ConqueTermSplit bash<cr>

" Minibuf explorer
nnoremap <Leader>4 :MBEbn<cr>
nnoremap <Leader>3 :MBEbp<cr>
let g:miniBufExplAutoStart = 1
let g:miniBufExplorerAutoStart = 1


" Ctrl-p search caching
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'

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
set path+=/usr/include
set path+=/usr/include/c++/4.6
set path+=$PWD/**

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


"Tab navigation
nnoremap <C-t> :tabnew<CR>
nnoremap <C-tab> :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>
