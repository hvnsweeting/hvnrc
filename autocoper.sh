#!/bin/bash

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
MY_PATH=$MY_PATH"/"

set -x
rsync -avz ~/.vimrc $MY_PATH"vimrc"
rsync -avz ~/.i3/config $MY_PATH"i3config"
rsync -avz ~/.hvnalias $MY_PATH"hvnalias"
rsync -avz ~/.bashrc $MY_PATH"bashrc"
rsync -avz ~/.Xresources $MY_PATH"Xresources"
rsync -avz ~/.tmux.conf $MY_PATH"tmux.conf"
rsync -avz ~/.xinitrc $MY_PATH"xinitrc"
rsync -avz ~/.inputrc $MY_PATH"inputrc"

set +x
