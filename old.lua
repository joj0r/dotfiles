-- Get file for local adjustments
vim.cmd('source ~/.vimrc_local')

-- Set numbers
vim.o.number = true
vim.o.relativenumber = true

-- Set tabwidth to 2 and spaces instead of numbers
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- From thePrimeagen
vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- Set leader to spacebar
vim.g.mapleader = " "

-- Search sould not be case sensitive
vim.o.ignorecase = true

-- Vim-Plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

	Plug('ledger/vim-ledger')
-- Wiki and Task
  Plug('vimwiki/vimwiki')
  Plug('tools-life/taskwiki')
  Plug('blindFS/vim-taskwarrior')
-- LSP and autocomplete
	Plug('prabirshrestha/vim-lsp')
	Plug('mattn/vim-lsp-settings')
	Plug('prabirshrestha/asyncomplete.vim')
  Plug('prabirshrestha/asyncomplete-lsp.vim')
-- Visual and interaction
	Plug('Yggdroot/indentLine')
	Plug('morhetz/gruvbox')
	Plug('christoomey/vim-tmux-navigator')
	Plug('knubie/vim-kitty-navigator', {
    ['do'] = 'cp ./*.py ~/.config/kitty/' 
  })
	Plug('preservim/nerdtree')
  Plug('AndrewRadev/splitjoin.vim')
  Plug('tpope/vim-surround')
  
-- Telescope
  Plug('nvim-lua/plenary.nvim')
  Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })
  Plug('nvim-telescope/telescope-fzf-native.nvim', { 
    ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' })

	Plug('vim-airline/vim-airline')
-- Git
	Plug('tpope/vim-fugitive')

vim.call('plug#end')

-- Set colorschemes
vim.cmd.colorscheme('gruvbox')
vim.g.airline_theme = 'gruvbox'

-- Vim-ledger
-- Fussy account and details first on search
vim.g.ledger_detailed_first = 1
vim.g.ledger_fuzzy_account_completion = 1

-- ledger
-- vim.api.nvim_create_autocmd({"FileType"}, {
--   pattern = "ledger",
--   callback = function()
--     vim.b.asyncomplete_enable = 0
--     vim.keymap.set('i', '<Tab>', function()
--       vim.fn['ledger#autocomplete_and_align']()
--     end, {buffer = true })
--   end
-- })

-- vim.api.nvim_create_autocmd({"FileType"}, {
--   pattern = "ledger",
--   callback = function()
--     vim.keymap.set('v', '<Tab>', '<cmd>:LedgerAlign<CR>', { silent = true })
--     vim.b.asyncomplete_enable = 0
--   end
-- })



-- Vimwiki
vim.g.vimwiki_global_ext = 0

-- Disable indentline for Wiki and MD files
vim.api.nvim_create_autocmd({"Filetype"}, {
  pattern = {"vimwiki", "markdown", "ledger"},
  callback = function()
     vim.g.indentLine_enabled = 0
  end
})

-- splitjoin mapping
vim.g.splitjoin_split_mapping = ''
vim.g.splitjoin_join_mapping = ''
vim.keymap.set('n', '<leader>j', '<cmd>:SplitjoinJoin<CR>')
vim.keymap.set('n', '<leader>s', '<cmd>:SplitjoinSplit<CR>')

--- Nerdtree remaping
vim.keymap.set('n', '<leader>n', '<cmd>:NERDTreeFocus<CR>')
vim.keymap.set('n', '<C-n>', '<cmd>:NERDTree<CR>')
vim.keymap.set('n', '<C-t>', '<cmd>:NERDTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', '<cmd>:NERDTreeFind<CR>')

-- Telescope remapping
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Get LSP-functionality from vimfile
-- until I do it properly in lua
vim.cmd('source ~/dotfiles/lsp_nvim.vim')
