#!/home/cameron/apps/ENV/bin/python2.7
import re
import sys
import os
import subprocess

# For python keyring, otherwise not needed
import keyring

# This defines the mapping of remote to local folders. On the left are the
# names of the remote folders. You may have to change the name on the left side
# to match your gmail's language. The right side is what the folders will be
# called on the local side. Notice that on the left side I prepend my folders
# that I don't read with a z. That way they end up on the bottom of a mailbox
# list.

mapping = { 'INBOX': 'INBOX'
	  , '[Gmail]/All Mail': 'all_mail'
		  , '[Gmail]/Drafts': 'drafts'
		  , '[Gmail]/Important': 'important'
		  , '[Gmail]/Sent Mail': 'zsent'
		  , '[Gmail]/Spam': 'zspam'
		  , '[Gmail]/Starred': 'zflagged'
		  , '[Gmail]/Trash': 'ztrash'
		  }




r_mapping = { val: key for key, val in mapping.items() }

def nt_remote(folder):
	try:
		return mapping[folder]
	except:
		#return re.sub(' ', '_', folder).lower()
		return folder;

def nt_local(folder):
	try:
		return r_mapping[folder]
	except:
		return folder
		#return re.sub('_', ' ', folder).capitalize()

def exclude(excludes):
	def inner(folder):
		try:
			excludes.index(folder)
			return False
		except:
			return True

	return inner

# This decrypts the password for my mailboxes using gpg and the gpg-agent. Note
# that location_of_password should be changed to the file path of what gpg file
# that you store your passwords in

def mailpasswd(server):
	if server == "szebenyib":
		pw = subprocess.check_output(["gpg", "-q", "--no-tty", 
		"-d","--use-agent", "~/.netrc.gpg"])
		return str(pw).strip()
	elif server == "szebenyibalint":
		pw = subprocess.check_output(["gpg", "-q", "--no-tty", 
		"-d","--use-agent", ".my-pwds.gpg"])
		return str(pw).strip()

def get_authinfo_password(machine, login, port=''):
	mc = re.compile("machine %s" % machine)
	po = re.compile("port %s" % port)
	lg = re.compile("login %s" % login)
	pw = re.compile("password ([^ ]+)")

	authinfo = os.popen("gpg -q --use-agent --no-tty -d ~/.authinfo.gpg").read()
	for l in authinfo.split('\n'):
		if (mc.search(l) and lg.search(l)):
			return pw.search(l).group(1)

	return None
