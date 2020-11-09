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

export CLICOLOR=YES
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
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

function git_branch(){
    # it will complain if cwd not a git repo, 2> it
    ref=$(git symbolic-ref --short --quiet HEAD 2>/dev/null)
    if [ -n "${ref}" ]; then
        echo "(""$ref"")"
    fi
}

setopt PROMPT_SUBST
## prompt -s redhat ->>>  [%n@%m %1~]%(#.#.$)
PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m:%{$fg[yellow]%}%1~%{$reset_color%} %{%F{green}%}$(git_branch)%{%F{none}%}$ '
RPROMPT='[%{$fg[yellow]%}%?%{$reset_color%}]'

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
if [ -f ~/.hvnalias ]; then
    . ~/.hvnalias
fi

export EDITOR='vi -u NONE'  # this mostly for edit git commit, open a full vim would be slow

# bash auto check for local email each 60s
export MAILCHECK=60

# Only source on OSX, on Ubuntu, profile source bashrc
if [ $(uname) != "Linux" ]; then
  source ~/.profile
fi

PATH=$GOPATH/bin/:$PATH
PATH="$HOME/.cargo/bin:$PATH"

if [ -e ~/.motd ]; then
  cat -ne ~/.motd
else
  echo "Missing ~/.motd, creating new one"
  touch ~/.motd
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

. /home/hvn/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
