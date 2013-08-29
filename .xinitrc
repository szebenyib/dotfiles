#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


#Gnome-keyring
#export SSH_AUTH_SOCK
#export GPG_AGENT_INFO
#export GNOME_KEYRING_CONTROL
#export GNOME_KEYRING_PID

#urxvt
xrdb -merge ~/.Xresources

#disable touchpad while typing
syndaemon -t -k -i 2 -d &

# exec gnome-session
# exec startkde
#exec startxfce4
# ...or the Window Manager of your choice

#slim
case $1 in
xfce4)
	exec startxfce4
	;;
i3|*)
	exec dbus-launch i3 
	;;
esac

# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:

export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

#GPG
eval $(gpg-agent --daemon) &
