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

-- ledger autocomplete
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "ledger",
  callback = function()
    vim.keymap.set('i', '<Tab>', function()
      local keys = vim.api.nvim_replace_termcodes(
        "<C-r>=ledger#autocomplete_and_align()<CR>",
        true, true, true
      )
      vim.api.nvim_feedkeys(keys, "i", true)
    end, { silent = true, buffer = true })
  end
})

-- Vimwiki
-- Change syntax to markdown and specify extension
vim.g.vimwiki_list = {{
  path = '/home/jonas/Nextcloud/Notes/vimwiki/',
  syntax = 'markdown',
  ext = '.md'
}}
