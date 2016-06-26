# ls
alias ls="ls --color=auto -Fh"
alias ll="ls -lv --group-directories-first"
alias la='ll -A'

command -v ack >/dev/null 2>&1 || { alias ack="ack-grep"; }
alias ed='ed -p "ed> "'
alias cd..='cd ..'
alias j='jobs -l'

# git
alias g='git'
complete -o default -o nospace -F _git g
alias gb='git b'
alias gba='git_active'
alias gs='git s'
alias gf='git f'
alias gr='git r'
alias dotgit='GIT_DIR=~/dotfiles/.git GIT_WORK_TREE=~/dotfiles git'

alias be='bundle exec'
alias jr='jruby -S'
alias bl='set_bundle_gemfile'
alias mrake='reattach-to-user-namespace -l rake'

alias treeless='tree -C | less -R'
alias llless='ls -A --color=always | less -R'

function git_active() {
  for k in `git branch -a|sed s/^..// | cut -d' ' -f1`
  do
    echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr %Cred%an%Creset" "$k" --` "$k"
  done | sort
}

set_bundle_gemfile () {
  if [[ -f Gemfile.local ]]; then
    export BUNDLE_GEMFILE=`readlink -m Gemfile.local`
  else
    unset BUNDLE_GEMFILE
  fi
}

# Handy Extract Program
function extract()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

function serve {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}

function speedtest {
  wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip
}

bu() {
  bundle $* && bundle exec gem rdoc --all --ri --no-rdoc 2>&1 | grep --color=auto -v -e '^Gem::SourceIndex' -e '^NOTE: Gem::SourceIndex'
}

function fixperms() { chmod -R u=rwX,g=rX,o=rX "$@" ;}

# unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages.
# ghc-pkg-clean -f cabal/dev/packages*.conf also works.
function ghc-pkg-clean() {
  for p in `ghc-pkg check $* 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'`
  do
    echo unregistering $p; ghc-pkg $* unregister $p
  done
}

# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place.
# When all else fails, use this to get out of dependency hell and start over.
function ghc-pkg-reset() {
  read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
  test x$ans == xy && ( \
    echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
    # echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
    # echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
  )
}

alias cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'"
