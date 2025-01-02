# Dotfiles for my Arch-systems

## Taskwarrior
- Legg til linje i ~/.taskrc:
	`include ~/.task/.taskrc`

## Bash

- Symlink:
  - `bash/bashrc-arch` -> `~/.bashrc`

- Endre alias-path i ~/.bashrc dersom ikke symlink:
	```
		if [ -f ~/.task/.bash_aliases ]; then
		    . ~/.task/.bash_aliases
		fi
	```
- Eventuelt kopier over .task/.bashrc til ~/.basrc for et bedre utgangspunkt

## Kitty

- Symlink:
  - `kitty/kitty.conf` -> `~/.config/kitty/kitty.conf`

## Neovim

- Symlink:
  - `nvim/init.lua` -> `~/.config/nvim/init.lua`
  - `nvim/local_[arch/wsl]` -> `~/.config/nvim/local.lua`

## Tmux

- Symlink:
    - `tmux.conf` -> `/home/jonas/.tmux.conf`

## Vim

- Lag symbolic link for .vimrc:
    - Arch-PC:
        - `vim/vimrc` -> `/etc/vimrc`
        - `vim/vimrc_user` -> `~/.vimrc`
        - `vim/vimrc_arch` -> `~/.vimrc_local`
    - Arch-WSL:
        - `vim/vimrc` -> `/etc/vim/vimrc`
        - `vim/vimrc_user` -> `~/.vimrc`
        - `vim/vimrc_wsl` -> `~/.vimrc_local`
    - Windows:
        - Åpne CMD med admin rights
        - kjør `mklink vimfiles\vimrc \\wsl.localhost\Arch\home\jonas\dotfiles\vim\vimrc_windows`

For å lage symlink: `ln -s source_file symbolic_link` 
    eventuelt legg til `-f` for å overskrive eksisterende link
