# If not running interactively, don't do anything
# [ -z "$PS1" ] && return

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/config
source ~/.bash/bashmarks.sh
source ~/dotfiles/resty/resty

if [ -f ~/.bash/liquidprompt/liquidprompt ]; then
  source ~/.bash/liquidprompt/liquidprompt
fi
PROMPT_COMMAND="$PROMPT_COMMAND;set_bundle_gemfile"

if [ -f ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark ]; then
  eval `dircolors ~/dotfiles/solarized/dircolors-solarized/dircolors.ansi-dark`
fi
