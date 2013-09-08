# My dotfiles repo

Under construction :) as I'm learning git.
------------------------------------------

## Needed/configured software by the dotfiles as denoted in ArchLinux repos.
### Pacman
+ i3-wm*
+ i3lock*
+ i3status*
+ feh
+ git
+ mpd
+ mutt
+ notmuch
+ vim
+ hg
+ msmtp
+ offlineimap
+ zsh

	*can be replaced by "i3" package

### AUR
+ urlview
+ goobook-git
+ dunst-git
+ python2-keyring (used to store passwords to avoid plain text)
+ python2-gnomekeyring (used to store passwords to avoid plain text)
+ gnome-keyring (used to store passwords to avoid plain text)
+ j4-dmenu-desktop-git

	yaourt -S urlview goobook-git python2-keyring python2-gnomekeyring gnome-keyring j4

## Installation
1. git clone the repo
2. choose appropriate branch
3. setup apps
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
