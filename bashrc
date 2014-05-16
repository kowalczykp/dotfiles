umask 0022

# If not running interactively, return
[ -z "$PS1" ] && return

# after this line is for interactive only

export EDITOR="vim"
export TERM=xterm-256color
set -o vi

# this is for ansible to show running output
export PYTHONUNBUFFERED=1

export HISTCONTROL=ignoredups:ignorespace
export HISTSIZE=1000
export HISTFILESIZE=2000

shopt -s checkwinsize
shopt -s histappend
shopt -s cdspell
shopt -s globstar
shopt -s checkjobs
shopt -s cmdhist
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
fi

if [ -f ~/dotfiles/liquidprompt/liquidprompt ]; then
  source ~/dotfiles/liquidprompt/liquidprompt
fi
PROMPT_COMMAND="$PROMPT_COMMAND;set_bundle_gemfile"

if [ -f ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark ]; then
  eval `dircolors ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark`
fi

if [ -f ~/dotfiles/bash_aliases ]; then
  source ~/dotfiles/bash_aliases
fi

if [ -f ~/dotfiles/bashmarks.sh ]; then
  source ~/dotfiles/bashmarks.sh
fi
