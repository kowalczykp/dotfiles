if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
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

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
