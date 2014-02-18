execute pathogen#incubate()
execute pathogen#helptags()
syntax on
filetype plugin indent on

nnoremap <Esc><Esc> :w<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-m> :NERDTreeFocus<CR>

nnoremap <C-p> :set hlsearch!<CR>

inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

nnoremap <silent> <C-q> :q<CR>
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-w> :tabclose<CR>
nnoremap <silent> <C-l> :tabn<CR>
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <Esc> :let @/=""<CR>
set ignorecase
set smartcase
set hlsearch
set showcmd
set wildmenu
