# Set up the prompt

#autoload -Uz promptinit
#promptinit

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


#color
autoload -U colors && colors
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m:%{$fg[yellow]%}%d%{$reset_color%}%#"
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]" 

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

export JAVA_HOME=/home/famihug/Apps/jdk1.6.0_21/
export PATH=$PATH:/home/famihug/Apps/jdk1.6.0_21/bin:~/Apps/android-sdk-linux/platform-tools:/home/famihug/Apps/apache-maven-3.0.3/bin:
# Below command use when use junit
#export CLASSPATH=$CLASSPATH:/media/Dale/Dropbox/DIC/javahvn/:~/Apps/mysql-connector-java-3.0.17-ga/mysql-connector-java-3.0.17-ga-bin.jar:
# export CLASSPATH=~/Apps/junit4.8.1/junit-4.8.1.jar:~/Apps/junit4.8.1/:~/Dropbox/DIC/javahvn/:

alias cdd='cd /media/Dale/Dropbox/'
alias padoff='sudo modprobe -r psmouse'
alias padon='sudo modprobe psmouse'
alias cb='~/bin/bat.sh'
alias repo='cd /media/Dale/Repository/; ls'
alias startlampp='sudo service mysql stop && sudo /opt/lampp/lampp start'
alias stoplampp='sudo /opt/lampp/lampp stop'
alias cdp='cd /opt/lampp/htdocs/'
alias tat='sudo shutdown -h now'
alias ff4='~/Apps/firefox/firefox &'
alias junit='java org.junit.runner.JUnitCore'
alias new='find ~/Dropbox/ -mtime -2'
alias new2='find /media/Dale/SavedHTML/ -name *.htm* -mtime -2'
alias lx='lynx /media/Dale/SavedHTML/'
alias jlab='cd /media/Dale/Dropbox/DIC/javahvn/'
alias ecl='~/Apps/eclipse/eclipse'
alias ws1='~/bin/ws1.sh'
alias ws='sudo service network-manager start; sudo modprobe psmouse' alias cm='tail /var/mail/famihug'
alias cdg='cd ~/Github/FAMILUG; ls'
alias clc='clear'
alias cdD='cd /media/Dale; ls'
alias zf='/opt/lampp/htdocs/zf/zf1.11.11/bin/zf.sh'
alias argouml='java -jar ~/Apps/argouml-0.34/argouml.jar &'
alias jedit='~/Apps/jEdit/jedit.jar &'
alias grepc='grep --color=always'
alias clj='java -cp ~/Apps/clojure-1.4.0/clojure-1.4.0.jar clojure.main'
alias sublime='/home/famihug/Apps/SublimeText2/sublime_text'
alias msql='sudo /opt/lampp/bin/mysql'
alias adbes='adb -s emulator-5554 shell'
alias adbue='adb -s emulator-5554 uninstall'
alias cdu="cd .."
alias startavd='Apps/android-sdk-linux/tools/emulator -avd Test2'
alias kqxs='python ~/bin/leecher.py && cat ~/bin/kq.txt'
alias cdw="cd ~/workspace/"

#var
apsx="com.aps."
head ~/.remember

#Todo.txt
PATH=$PATH:~/Apps/todo.txt_cli-2.9/
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d ~/Apps/todo.txt_cli-2/todo.cfg'
alias py='python2.7'
