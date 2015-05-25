# My dotfiles repo

Under construction :) as I'm learning git.
------------------------------------------

## Needed/configured software by the dotfiles as denoted in ArchLinux repos.
### Pacman
+ curl
+ i3-wm*
+ i3lock*
+ i3status*
+ feh
+ git
+ mpc
+ mpd
+ mutt
+ notmuch
+ ncmpcpp**
+ ranger***
+ vim
+ hg
+ msmtp
+ offlineimap
+ zsh

	*can be replaced by "i3" package
	**configured to use pulseaudio-alsa
	***optional dependencies of ranger: libcaca, highlight, atool,
	lynx, poppler, transmission-show, mediainfo

### AUR
+ urlview
+ goobook-git
+ dunst-git
+ python2-keyring (used to store passwords to avoid plain text)
+ python2-gnomekeyring (used to store passwords to avoid plain text)
+ gnome-keyring (used to store passwords to avoid plain text)
+ j4-dmenu-desktop-git
+ liquidprompt-git

	yaourt -S urlview goobook-git python2-keyring python2-gnomekeyring gnome-keyring j4 liquidprompt-git

## Installation
1. git clone the repo
2. choose appropriate branch
3. setup apps

- mutt
	sudo chmod +x ~/.mutt/mutt_bgrun
	sudo mv ~/.mutt/mutt_bgrun /usr/bin
- keyring
	~ python2
	>>> import keyring
	>>> keyring.set_password("offlineimap", "username@gmail.com", "guesswhatcomeshere¨)
	[enter an arbitrary password in the window that pops up]
- zshrc
	Copy to every home directory you wish to use it with (e.g. root, remote
	server) and don't forget to set your default prompt in /etc/passwords.
- msmtp
	chmod 600 .msmtprc
- mpd&ncmpcpp
	mkdir -p ~/.mpd/playlists
	touch ~/.mpd/{database,log,state,pid,sticker.sql}
	ln -s /path/to/music ~/music
	sudo pacman -S pulseaudio-alsa
	#Launch ncmpcpp and press 'u' to update the database

4. vim-r-plugin

- bash:
	sudo pacman -S tmux wmctrl
	mkdir ~/tmp/vimcom
	R CMD INSTALL VimCom
- R: install.packages(c("colorout", "setwidth"))
- bash:
	mkdir ~/tmp/vimr
	cd ~/tmp/vimr
	wget http://www.vim.org/scripts/download_script.php?src_id=22981
	vim Vim-R-plugin.vmb
- vim:
	:so %
	<hit space as needed>

