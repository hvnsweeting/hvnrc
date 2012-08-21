#!/usr/bin/env python
import os
import subprocess


def fix_path(filename):
    fullname = os.path.realpath(__file__)
    path = os.path.dirname(fullname)
    return os.path.join(path, filename)

HOMEPATH = os.path.expanduser("~")

source_dest = {"~/.vimrc": "vimrc_atvcc",
                "~/.i3/config" : "i3config",
                "~/.bash_aliases" : "bash_aliases",
                "~/.bashrc" : "bashrc",
              }

#run all copy command
for source in source_dest:
    command = "rsync "
    arg1 = "-avz "
    new_source = source.replace("~", HOMEPATH)  # change ~ to /home/hvn
    subprocess.call(["rsync", "-avz" , new_source, fix_path(source_dest[source])])

#Push them all

subprocess.call(["git", "add -A"])
subprocess.call(["git", "commit -m 'update'"])
subprocess.call(["git", "push origin master"])
