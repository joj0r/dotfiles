vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.g.mapleader = " "
vim.o.smartcase = true

-- Vim-Plug
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

	Plug('ledger/vim-ledger')
-- Wiki and Task
  Plug('vimwiki/vimwiki')
  Plug('tools-life/taskwiki')
  Plug('blindFS/vim-taskwarrior')
-- Visual and interaction
	Plug('morhetz/gruvbox')
	Plug('knubie/vim-kitty-navigator', {
    ['do'] = 'cp ./*.py ~/.config/kitty/' 
  })
	Plug('preservim/nerdtree')
	Plug('vim-airline/vim-airline')

vim.call('plug#end')

vim.cmd.colorscheme('gruvbox')
vim.g.airline_theme = 'gruvbox'

-- Ledger addin config
vim.g.ledger_date_format = '%Y-%m-%d'
-- Kolonne som . i beløp skal alignes med
vim.g.ledger_align_at = 45
vim.g.ledger_default_commodity = 'kr'
-- kr kommer etter beløp
vim.g.ledger_commodity_before = 0
-- Fussy account and details first on search
vim.g.ledger_detailed_first = 1
vim.g.ledger_fuzzy_account_completion = 1
      vim.fn['ledger#autocomplete_and_align']()

-- ledger
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "ledger",
  callback = function()
    vim.keymap.set('i', '<Tab>', function()
      vim.fn['ledger#autocomplete_and_align']()
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes('<CR>', true, false, true),
        'i',
        false
      )
    end, { silent = true } )
  end
})


vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = "ledger",
  callback = function()
    vim.keymap.set('v', '<Tab>', '<cmd>:LedgerAlign<CR>', { silent = true })
  end
})


-- Vimwiki
-- Change syntax to markdown and specify extension
vim.g.vimwiki_list = {{
  path= '~/Nextcloud/Notes/vimwiki/',
  syntax= 'markdown',
  ext= '.md' 
}}
vim.g.vimwiki_global_ext = 0

--- Nerdtree remaping
vim.keymap.set('n', '<leader>n', '<cmd>:NERDTreeFocus<CR>')
vim.keymap.set('n', '<C-n>', '<cmd>:NERDTree<CR>')
vim.keymap.set('n', '<C-t>', '<cmd>:NERDTreeToggle<CR>')
vim.keymap.set('n', '<C-f>', '<cmd>:NERDTreeFind<CR>')
