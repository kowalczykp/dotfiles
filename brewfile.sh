brew tap homebrew/binary
brew tap homebrew/versions
brew tap caskroom/cask
brew tap neovim/homebrew-neovim
brew tap manastech/crystal
brew tap universal-ctags/universal-ctags
brew tap homebrew/science

brew update
brew upgrade --all

brew install mercurial
brew install tig
brew install git
brew install git-extras
brew install git-sh
brew install mercurial

#install mongodb
#install mysql
#install redis
#install sqlite
#install haproxy
#install nginx
#install postgresql
#install chicken
#install casperjs
#install phantomjs
#install gcc48
#install gcc49
brew install ghc cabal-install
#brew install clamav
#install ssh-copy-id
#install s3cmd
#install fdupes
#install markdown
#install duplicity
#install gd
#install graphviz --with-pdf
#install reattach-to-user-namespace
#install docker
#install id3tool
#install imagemagick
#install unrar
#install libdvdcss
#install dos2unix
#install nmap
#install archey

brew install libtool
brew install libyaml
# brew install libressl
brew install openssl

brew install autoconf
brew install automake
brew install pkg-config
brew install readline
brew install valgrind
brew install gcc
brew install chruby
brew install ruby-install
brew install nodejs
brew install go
brew install bdw-gc gmp libevent libpcl libxml2 libyaml llvm
brew link llvm --force

brew install bash
brew install bash-completion
brew install coreutils
brew install ack
brew install wget
brew install ctags
brew unlink ctags
brew install htop
brew install watch
brew install vim
brew install tmux
brew install ranger
brew install cowsay
brew install wakeonlan
brew install tree
brew install smartmontools
brew install libvorbis
brew install libvpx
brew install libfaac
brew install ffmpeg --with-libvpx --with-theora --with-libvorbis --with-faac
brew install ffmpeg2theora
brew install ansible
brew install syncthing010
brew install python
brew install xhyve

brew install caskroom/cask/brew-cask

# Applications
brew install Caskroom/cask/java
brew cask install vagrant
brew cask install virtualbox
brew cask install google-chrome
brew cask install iterm2
brew cask install skype
brew cask install sequel-pro
brew cask install vlc
brew cask install flash
brew cask install firefox
brew cask install tunnelblick
brew cask install sqlitebrowser
brew cask install evernote
brew cask install bettertouchtool
brew cask install gpgtools
brew cask install slack
brew cask install mou

# brew cask install paparazzi
# brew cask install appcleaner
# brew cask install daisydisk
# brew cask install disk-inventory-x
# brew cask install tinkertool
# brew cask install intel-power-gadget
# brew cask install torbrowser
# brew cask install google-drive
# brew cask install calibre
# brew cask install musicbrainz-picard
# brew cask install dropbox

#cask install plex
#cask install unison-usenet
#cask install adium
#cask install git-annex

brew install --HEAD neovim
brew install crystal-lang --with-llvm
brew install --HEAD universal-ctags

# Science
brew install gnuplot --with-qt --with-x11
brew cask install mactex
brew cask install xquartz
brew install ghostscript
brew install octave --with-x11
brew install fltk

brew cleanup

pip install glances
