-- Open links correctly on wsl
vim.g.netrw_browsex_viewer="cmd.exe /C start"

-- Vimwiki
-- Change syntax to markdown and specify extension
vim.g.vimwiki_list = {{
  path= '/home/jonas/notes/vimwiki/',
  syntax= 'markdown',
  ext= '.md' 
}}
