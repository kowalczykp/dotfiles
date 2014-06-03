My dotfiles for Vim, Git and Bash and more ...

Some of the vimrc settings require vim 7.3 or greater.

## Install

    cd ~
    git clone https://github.com/hatoishi/dotfiles.git
    cd dotfiles
    git submodule --init update
    ./install.sh

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
