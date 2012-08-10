#!/bin/sh

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
rsync -avz ~/.vimrc $MY_PATH"vimrc_atvcc"
rsync -avz ~/.i3/config $MY_PATH"i3config"
rsync -avz ~/.vimrc $MY_PATH"vimrc_atvcc"
rsync -avz ~/.bash_aliases $MY_PATH"bash_aliases"
rsync -avz ~/.bashrc $MY_PATH"bashrc"
