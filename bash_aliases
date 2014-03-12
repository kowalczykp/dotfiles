# ls
alias ls="ls --color=auto -Fh"
alias ll="ls -lv --group-directories-first"
alias la='ll -A'

command -v ack >/dev/null 2>&1 || { alias ack="ack-grep"; }
alias ed='ed -p "ed> "'

# git
alias gg='git'
complete -o default -o nospace -F _git gg
alias gb='git branch -avv'
alias gs='git status'
alias gf='git fetch -p --all'
alias gr='git remote -v'

alias be='bundle exec'
alias bl='set_bundle_gemfile'

alias treeless='tree -C | less -R'
alias llless='ls -A --color=always | less -R'

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

function fixperms() { chmod -R u=rwX,g=rX,o=rX "$@" ;}
