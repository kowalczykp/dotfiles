# my dotfiles do not include a .profile
# but it is executed here, so check it doesnt do stuff you dont want
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

export GOPATH=$HOME/gocode
export PATH=$PATH:$HOME/gocode/bin
