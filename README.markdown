My dotfiles.

Vimrc using pathogen and git submodules manage vim plugins.

Some of the vimrc settings require vim 7.3 or greater.

## Install

1. git clone into home directory
2. cd dotfiles
3. git submodule init

You might want to be selective which submodules you update, there is quite
a few now and some may not be required.

4. git submodule update
5. ./install.sh

The install script is not destructive so if you want to replace the original
files, delete them first.

## Install in OSX

My .localrc file is:

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

There are lots of homebrew packages set up in there.
