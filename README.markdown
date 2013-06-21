My dotfiles, at the moment vim and tmux.  Vimrc using git submodules manage vim
plugins.  Some of the vimrc settings require vim 7.3 or greater.

I use the word 'my' loosely. All files have been patched together from many
different sources and customised to my own tastes.

## Install

1) git clone into home directory
2) cd dotfiles
3) git submodule init

You might want to be selective which submodules you update, theres quite
a few now and some may not be required.

4) git submodule update
5) ./install.sh

The install script is not destructive so if you want to replace the original
file, delete them first.

## Install in OSX

My .localrc file is:

    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
    source /usr/local/git/contrib/completion/git-completion.bash
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export PATH="/usr/local/sbin:$PATH"

There are lots of homebrew packages set up in there.
