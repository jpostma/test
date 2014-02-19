execute pathogen#incubate()
execute pathogen#helptags()
syntax on
filetype plugin indent on

nnoremap <Esc><Esc> :w<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :NERDTreeFocus<CR>

nnoremap <C-p> :set hlsearch!<CR>

noremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>


nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> <leader>t :tabnew<CR>
nnoremap <silent> <leader>w :tabclose<CR>
nnoremap <silent> <leader>l :tabn<CR>
nnoremap <silent> <leader>h :tabn<CR>
nnoremap <silent> <Esc> :let @/=""<CR>

set ignorecase
set smartcase
set hlsearch
set showcmd
set wildmenu
set incsearch
set ruler
set showmatch
try
	colorscheme evening
catch
endtry

"special characters display
set listchars=tab:>-,eol:<,nbsp:%,trail:.
nnoremap <C-o> :set list!<CR>
