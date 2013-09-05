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
3.1. Keyring
	~ python2
	>>> import keyring
	>>> keyring.set_password("offlineimap", "szebenyib@gmail.com", "guesswhatcomeshere¨)
	[enter an arbitrary password in the window that pops up]

