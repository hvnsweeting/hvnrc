# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
echo $(~/bin/bat.sh)

export JAVA_HOME=/home/famihug/Apps/jdk1.6.0_21/bin/java
export PATH=$PATH:/home/famihug/Apps/jdk1.6.0_21/bin:~/Apps/android-sdk-linux/platform-tools:
alias cdd='cd /media/Dale/Dropbox/'
alias padoff='sudo modprobe -r psmouse'
alias padon='sudo modprobe psmouse'
alias cb='~/bin/bat.sh'
echo
head ~/toDoNetList
alias repo='cd /media/Dale/Repository/; ls'
alias startlampp='sudo /opt/lampp/lampp start'
alias cdp='cd /opt/lampp/htdocs/'
alias tat='sudo shutdown -h now'
alias ff4='~/Apps/firefox/firefox &'
# Below command use when use junit
#export CLASSPATH=$CLASSPATH:/media/Dale/Dropbox/DIC/javahvn/:~/Apps/mysql-connector-java-3.0.17-ga/mysql-connector-java-3.0.17-ga-bin.jar:
# export CLASSPATH=~/Apps/junit4.8.1/junit-4.8.1.jar:~/Apps/junit4.8.1/:~/Dropbox/DIC/javahvn/:
alias junit='java org.junit.runner.JUnitCore'
alias new='find ~/Dropbox/ -mtime -2'
alias new2='find /media/Dale/SavedHTML/ -name *.htm* -mtime -2'
alias lx='lynx /media/Dale/SavedHTML/'
alias jlab='cd /media/Dale/Dropbox/DIC/javahvn/'
alias ecl='~/Apps/eclipse/eclipse'
alias ws1='~/bin/ws1.sh'
alias ws='sudo service network-manager start; sudo modprobe psmouse'
alias cm='tail /var/mail/famihug'
alias cdg='cd ~/Github/FAMILUG; ls'
alias clc='clear'
alias cdD='cd /media/Dale; ls'
alias zf='/opt/lampp/htdocs/zf/zf1.11.11/bin/zf.sh'
alias adbc='adb connect'
alias argouml='java -jar ~/Apps/argouml-0.34/argouml.jar &'
alias kqxs='~/bin/leecher.py; cat kq.txt'
