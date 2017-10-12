umask 0022

# If not running interactively, return
[ -z "$PS1" ] && return

# after this line is for interactive only

export EDITOR="vim"
# export TERM=screen-256color
export TERM=xterm-256color
set -o vi

# this is for ansible to show running output
export PYTHONUNBUFFERED=1

# history config
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=10000
HISTFILESIZE=-1
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

shopt -s checkwinsize
shopt -s cdspell
shopt -s globstar
shopt -s checkjobs
shopt -s extglob
shopt -s autocd

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# search for dirs in home
export CDPATH=.:~

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
   
  # this fixes the g git alias
  if [ -f /usr/share/bash-completion/completions/git ]; then
    source /usr/share/bash-completion/completions/git
  elif [ -f /etc/bash_completion/completions/git ]; then
    source /etc/bash_completion/completions/git
  fi
fi

if [ -f ~/dotfiles/liquidprompt/liquidprompt ]; then
  [[ $- = *i* ]] && source ~/dotfiles/liquidprompt/liquidprompt
fi

if [ -f ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark ]; then
  eval `dircolors ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark`
fi

if [ -f ~/dotfiles/bashmarks.sh ]; then
  source ~/dotfiles/bashmarks.sh
fi

if [ -f ~/dotfiles/z/z.sh ]; then
  source ~/dotfiles/z/z.sh
fi

if [ -f ~/dotfiles/bash_aliases ]; then
  source ~/dotfiles/bash_aliases
fi
