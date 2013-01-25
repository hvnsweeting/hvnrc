#!/bin/bash

#set -x
# SD = source destination
SDVIM="vimrc_atvcc $HOME/.vimrc"
SDBASH="bashrc $HOME/.bashrc"
SDALIAS="hvnalias $HOME/.hvnalias"
SDI3="i3config $HOME/.i3/config"

#TODO write SD* another way, maybe use array
echo "Running deployer, this file should be run with \`source `basename $0`\`"
for i in "$SDVIM" "$SDBASH" "$SDALIAS" "$SDI3";do
    echo $i
    if [[ -e `which colordiff` ]]; then
        colordiff $i
    else
        diff $i
    fi

    if [[ $(diff -q $i | wc -l) -eq "1" ]]; then
        cp -i $i
    fi
    echo 
    echo 
    echo -e "\e[0;33m------------------------\e[m"
done
#set +x
