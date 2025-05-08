" Get settings for personal computer
source ~/.vimrc_local

" Set numbers
set number
set relativenumber

" Set tabwidth to 2 and spaces instead of numbers
set tabstop =2
set shiftwidth =2
set expandtab

" Set leader to spacebar
let mapleader = " "

" Search should not be case sensitive
set smartcase

" Mapping to insert line break
nmap m a<CR><ESC>l

" Install vim-plug from https://github.com/junegunn/vim-plug

" List all the plugins you want to install
call plug#begin('~/.vim/plugged')
	Plug 'ledger/vim-ledger'
  "
	" Wiki and Task
	Plug 'vimwiki/vimwiki'
	Plug 'tools-life/taskwiki'
	Plug 'blindFS/vim-taskwarrior'
  "
	" LSP and autocomplete
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
	" Plug 'github/copilot.vim'
  "
	" Visual and interaction
	Plug 'Yggdroot/indentLine'
	" Plug 'christoomey/vim-tmux-navigator'
	Plug 'knubie/vim-kitty-navigator', {
				\ 'do': 'cp ./*.py ~/.config/kitty/' }
	Plug 'morhetz/gruvbox'
	Plug 'preservim/nerdtree'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'tpope/vim-surround'
  "
  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 
          \ 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && 
          \ cmake --build build --config Release' }
	" Plug 'preservim/tagbar'
	Plug 'vim-airline/vim-airline'
	" Plug 'prettier/vim-prettier', { 
	" 			\ 'do': 'npm install' }
  "
  " Samlepakke med syntax
  " Plug 'sheerun/vim-polyglot'
  "
	" Git
	Plug 'tpope/vim-fugitive'
call plug#end()

" Set coloschemes
colorscheme gruvbox
let g:airline_theme = 'gruvbox'


" For vim-ledger
au FileType ledger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
au FileType ledger vnoremap <silent> <Tab> :LedgerAlign<CR>
" Disable asyncomplete in ledger files
au FileType ledger let b:asyncomplete_enable = 0

let g:ledger_detailed_first = 1
let g:ledger_fuzzy_account_completion = 1


" Vimwiki
" Change syntax to markdown and specify extension
let g:vimwiki_global_ext = 0
au FileType vimwiki let g:indentLine_enabled = 0
au FileType markdown let g:indentLine_enabled = 0

" splitjoin mapping
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <leader>j :SplitjoinJoin<CR>
nmap <leader>s :SplitjoinSplit<CR>

" Nerdtree remaping
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:lsp_async_completion = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
   nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    " Keyboard mappings for asyncomplete.vim
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Telescope mappings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
