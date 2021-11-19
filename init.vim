"execute pathogen#interpose('bundle/{}')
"execute pathogen#helptags()
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'mhinz/vim-startify'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'vim-airline/vim-airline'

Plug 'liuchengxu/vim-which-key'
"Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'puremourning/vimspector'

Plug 'cdelledonne/vim-cmake'

call plug#end()

" Must explicetly source from ~ since $HOME isn't supported in plugins like VsVim
source ~/vimrc_common

let g:sneak#label = 1
colorscheme tokyonight

if has('win32')
	let g:python3_host_prog='C:\Users\johan\AppData\Local\Programs\Python\Python37\python.EXE'
	let g:loaded_python_provider=0
endif

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local servers = { 'pyright','clangd'}
  for _, lsp in ipairs(servers) do
	  nvim_lsp[lsp].setup {
		  on_attach = on_attach,
		  capabilities = capabilities,
		  flags = {
			  debounce_text_changes = 150,
			  }
		  }
  end

EOF

if !has('win32')
nnoremap <leader>t :split term://zsh<CR>
endif

packadd termdebug

set completeopt=menu,menuone,noselect

" -------- Debugging ------------------------
"let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nmap <F5> <Plug>VimspectorContinue
nmap <S-F5> <Plug>VimspectorStop
"nmap <F9> <Plug>VimspectorToggleConditionalBreakpoint

nmap <F5>	<Plug>VimspectorContinue
nmap <F3>	<Plug>VimspectorStop
nmap <F4>	<Plug>VimspectorRestart	
nmap <F6>	<Plug>VimspectorPause
nmap <F9>	<Plug>VimspectorToggleBreakpoint
"nmap <leader>F9	<Plug>VimspectorToggleConditionalBreakpoint	Toggle conditional line breakpoint or logpoint on the current line.
nmap <F8>	<Plug>VimspectorAddFunctionBreakpoint
"nmap <leader>F8	<Plug>VimspectorRunToCursor	Run to Cursor
nmap <F1>0	<Plug>VimspectorStepOver
nmap <F1>1	<Plug>VimspectorStepInto
nmap <F1>2	<Plug>VimspectorStepOut

" -------- Telescope ------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>vh <cmd>Telescope help_tags<cr>

" -------- Which Key -------------------------
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

" ----------------------------------------
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
let g:miniBufExplAutoStart = 0
let g:miniBufExplorerAutoStart = 0


" Ctrl-p search caching
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_max_files = 0
" let g:ctrlp_max_history = 0
" let g:ctrlp_working_path_mode = 'rwa'
" let g:ctrlp_cmd = 'CtrlPMRU'
" let g:ctrlp_use_caching = 1
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:1000'

"EasyMotion
map <Leader>e <Plug>(easymotion-prefix)
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First MatchParen
hi link EasyMotionTarget2Second MatchParen


" General autocomplete helpers
" hi Pmenu ctermbg=3 ctermfg=White
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
" inoremap <expr> <CR> pumvisible() ? ("\<C-y>") : "\<C-g>u\<CR>"
" set completeopt=longest,menuone
" set conceallevel=2
" set concealcursor=inv
" 
" " ctags
" set tags+=~/.vim/tags

" Differation keybinding
nnoremap <silent> <Leader>df :call DiffToggle()<CR>
nnoremap <silent> <Leader>dw :call WhiteDiffToggle()<CR>
nnoremap <silent> <Leader>dc :call FillerDiffToggle()<CR>

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

" TODO: Make general purpose toggle function
let g:whitespace_diff=1
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

let g:filler_diff=1
function! FillerDiffToggle()
	if g:filler_diff
		echo "Diff-filler off"
		let g:filler_diff=0
		set diffopt-=filler
	else
		echo "Diff-filler on"
		let g:filler_diff=1
		set diffopt+=filler
	endif
endfunction


if has('win32')
  " Avoid mswin.vim making Ctrl-v act as paste
  source $VIMRUNTIME/mswin.vim
  nnoremap <C-V> <C-V>
  nnoremap <C-Y> <C-Y>
  nnoremap <C-A> <C-A>
endif

"Tab navigation
nnoremap <silent> <C-t> :tabnew<CR>
nnoremap <silent> <C-tab> :tabnext<CR>
nnoremap <silent> <C-S-tab> :tabprevious<CR>
nnoremap <silent> <leader>d :tabn<CR>
noremap <silent> <leader>a :tabp<CR>
