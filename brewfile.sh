function install {
  if brew cask list | grep -q $1
  then echo "Already installed $1"
  else brew cask install $1
  fi
}

brew tap homebrew/binary
brew tap homebrew/versions
brew tap neovim/homebrew-neovim
brew tap manastech/crystal
brew tap universal-ctags/universal-ctags
brew tap homebrew/science
brew tap buo/cask-upgrade
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

brew update
brew upgrade

brew install mercurial
brew install tig
brew install git
brew install git-extras
brew install git-sh
brew install mercurial

brew install ghc cabal-install

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
#install clamav
#install ssh-copy-id
#install s3cmd
#install fdupes
#install markdown
#install duplicity
#install gd
#install graphviz --with-pdf
#install reattach-to-user-namespace
#install id3tool
#install imagemagick
#install unrar
#install libdvdcss
#install dos2unix
#install nmap
#install archey

brew install libtool
brew install libyaml
brew install openssl
# brew install libressl

brew install docker
brew install docker-machine
brew install docker-compose
brew install docker-clean
brew install docker-machine-driver-xhyve

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
brew install syncthing
brew install python
brew install --HEAD xhyve
brew install dnsmasq

brew install --HEAD neovim
brew install crystal-lang --with-llvm
brew install --HEAD universal-ctags

# Science
brew install gnuplot --with-qt --with-x11
brew install ghostscript
brew install octave --with-x11
brew install fltk

brew install homebrew/fuse/sshfs
install osxfuse
install macfusion

# Applications
install vagrant
install virtualbox
install google-chrome
install iterm2
install skype
install sequel-pro
install vlc
install flash-player
install firefox
install viscosity
install sqlitebrowser
install evernote
install gpgtools
install slack
install mou
install wkhtmltopdf
install aerial
install flux
install recordit
install clipgrab
install omnidisksweeper
install torbrowser
install tagspaces
install pgadmin3
install avidemux
install audacity
install aegisub
install duet
install mactex
install font-fontawesome
install xquartz
install java
install deluge
install keybase

# brew cask install paparazzi
# brew cask install appcleaner
# brew cask install daisydisk
# brew cask install disk-inventory-x
# brew cask install tinkertool
# brew cask install intel-power-gadget
# brew cask install google-drive
# brew cask install calibre
# brew cask install musicbrainz-picard
# brew cask install dropbox
#cask install plex
#cask install unison-usenet
#cask install adium
#cask install git-annex

brew cleanup
brew cask cleanup
