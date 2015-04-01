execute pathogen#interpose('bundle/{}')
execute pathogen#helptags()

" Must explicetly source from ~ since $HOME isn't supported in plugins like VsVim
source ~/vimrc_common

nnoremap <silent> <C-q> :q<CR>

" Shell scripts
map <F6> :wa<CR> :!"%:p"<CR>


hi StatusLine   ctermfg=15  "ctermbg=239
hi StatusLineNC ctermfg=249 ctermbg=237

" Search completion with grep
" nmap <C-F> :noautocmd vimgrep input("Enter search pattern\n") *<CR>
nnoremap <leader>k :call Vimgrep_Input()<CR>
nnoremap <leader>K :silent exe 'vimgrep /' . expand("<cword>"). '/jPP **/*'<CR>

let g:user_inputsearchfilter = '**/*.cpp'
function! Vimgrep_Input()
	call inputsave()
	let userinput = input("Enter your search pattern\n")
	call inputrestore()
	" silent noautocmd exe 'lvimgrep /' . userinput . '/jg **/*'
	silent exe 'vimgrep /' . userinput . '/jPP **/*'
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

" ctags
set tags+=~/.vim/tags

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
