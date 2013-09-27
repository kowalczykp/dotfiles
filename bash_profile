# my dotfiles do not include a .profile
if [ -r ~/.profile ]; then
  source ~/.profile
fi

case "$-" in *i*) if [ -r ~/.bashrc ]; then source ~/.bashrc; fi;; esac

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if command -v keychain >/dev/null 2>&1; then
  keychain
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# this is for ansible to show running output
export PYTHONUNBUFFERED=1
