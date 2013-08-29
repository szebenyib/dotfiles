#!/usr/bin/python2
import offlineimap


passwd = offlineimap.get_authinfo_password("imap.gmail.com", "szebenyib@gmail.com", "imap")
print(passwd)
