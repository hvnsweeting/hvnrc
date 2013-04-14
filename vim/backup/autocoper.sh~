#!/bin/sh

MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
MY_PATH=$MY_PATH"/"

set -x
if [ $(hostname) == "lappy" ];then
    rsync -avz ~/.vimrc $MY_PATH"vimrc"
else
    rsync -avz ~/.vimrc $MY_PATH"vimrc_atvcc"
fi

set +x
rsync -avz ~/.i3/config $MY_PATH"i3config"
rsync -avz ~/.bash_aliases $MY_PATH"bash_aliases"
rsync -avz ~/.bashrc $MY_PATH"bashrc"
