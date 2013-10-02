#!/bin/bash

# bash array
arr=("vimrc $HOME/.vimrc"
    "bashrc $HOME/.bashrc"
    "hvnalias $HOME/.hvnalias"
    "tmux.conf $HOME/.tmux.conf"
    "inputrc $HOME/.inputrc"
    "i3config $HOME/.i3/config")

echo "Running deployer, this file should be run with \`source `basename $0`\`"

for i in "${arr[@]}";do
    echo "diff" $i
    if [[ -e `which colordiff` ]]; then
        colordiff $i
    else
        diff $i
    fi

    if [[ ! -f "$i" ]] || [[ $(diff -q $i | wc -l) -eq "1" ]] ; then
        cp -i $i
    fi
    tput bold
    echo "--------------------------------------"
    tput sgr0
done
