export EDITOR="vim"
export TERM=screen-256color
set -o vi

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# missing or swapping characters
shopt -s cdspell
shopt -s globstar
shopt -s checkjobs
shopt -s cmdhist
shopt -s extglob
shopt -s autocd

# search for dirs in home
export CDPATH=.:~

# the default for ubuntu seems to be 0002
# which results in 664/775 not the 644/755
umask 0022

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  source /etc/bash_completion
fi

if command -v keychain >/dev/null 2>&1; then
  keychain
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

if [ -f ~/dotfiles/resty/resty ]; then
  source ~/dotfiles/resty/resty
fi
