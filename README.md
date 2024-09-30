# Taskwarrior-repo

## Contexts
Det er opprettet to contexts for TW:
- Work
- Home

## .files

### .taskrc
- Legg til linje i ~/.taskrc:
	`include ~/.task/.taskrc`

### .bash_aliases

- Endre alias-path i ~/.bashrc:
	```
		if [ -f ~/.task/.bash_aliases ]; then
		    . ~/.task/.bash_aliases
		fi
	```
- Eventuelt kopier over .task/.bashrc til ~/.basrc for et bedre utgangspunkt

### .vimrc

- Lag symbolic link for .vimrc:
    - Arch-PC og Arch-wsl:
        - `/etc/vimrc`
        - `~/.vimrc`
        - `~/.vimrc_local`
    - WSL:
        - `/etc/vim/vimrc`
        - `~/.vimrc`
        - `~/.vimrc_local`

For å lage symlink: `ln -s source_file symbolic_link` 
    eventuelt legg til `-f` for å overskrive eksisterende link

For å lage symlink i CMD:
- Åpne CMD med admin rights
- kjør `mklink vimfiles\vimrc \\wsl.localhost\Arch\home\jonas\dotfiles\.vimrc_windows`

### .tmux.conf

- Symlink:
    - `ln -sf /home/jonas/.task/.tmux.conf /home/jonas/.tmux.conf`
