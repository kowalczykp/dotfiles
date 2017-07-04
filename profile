if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/dotfiles/bin" ] ; then
  PATH="$HOME/dotfiles/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -s "$HOME/.rvm/scripts/rvm" ] ; then
  source "$HOME/.rvm/scripts/rvm"
fi

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

if command -v keychain >/dev/null 2>&1; then
  keychain
fi

if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
  fi
fi
