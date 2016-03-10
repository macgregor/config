#!/usr/bin/python

'''
src: http://obensonne.bitbucket.org/blog/20100130-encfs-keyring.html

Uses gnomekeyring to mount encfs folder

Adapt to yubikey using:
https://github.com/Yubico/python-yubico
'''

import os.path
import subprocess
import sys
import gtk
import gnomekeyring as gk

# paths constants:
PATH_ENCRYPTED = os.path.expanduser("~/Dropbox/Encrypted")
PATH_DECRYPTED = os.path.expanduser("~/Private")

# get the encfs-dropbox item:
try:
    items = gk.find_items_sync(gk.ITEM_GENERIC_SECRET, {"encfs": "dropbox"})
    item = items[0] # clean up your keyring if this list has multiple items
except gk.NoMatchError:
    print("no entry in keyring")
    sys.exit(1)

# run encfs:
cmd = ["encfs", "-S", PATH_ENCRYPTED, PATH_DECRYPTED]
p = subprocess.Popen(cmd, stdin=subprocess.PIPE)
err = p.communicate(input="%s\n" % item.secret)[1]

# either there is an error or we are done:
if err:
    print(err)
    sys.exit(1)
