# My dotfiles repo

Under construction :) as I'm learning git.
------------------------------------------

## Needed/configured software by the dotfiles as denoted in ArchLinux repos.
### Pacman
+ i3-wm
+ i3lock
+ dunst
+ feh
+ mpd
+ mutt
+ notmuch
+ vim
+ hg
+ msmtp
+ offlineimap
+ zsh

### AUR
+ urlview
+ goobook-git
+ python2-keyring (used to store passwords to avoid plain text)
+ python2-gnomekeyring (used to store passwords to avoid plain text)
+ gnome-keyring (used to store passwords to avoid plain text)

## Installation
1. git clone the repo
2. choose appropriate branch
3. setup apps
-Keyring
	~ python2
	>>> import keyring
	>>> keyring.set_password("offlineimap", "username@gmail.com", "guesswhatcomeshere¨)
	[enter an arbitrary password in the window that pops up]
-ZSHRC
	Copy to every home directory you wish to use it with (e.g. root, remote
	server) and don't forget to set your default prompt in /etc/passwords.
