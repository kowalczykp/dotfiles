#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PLUGINS="nvim/pack/plugins/start/"
git submodule init
for REPO in \
  tpope/vim-sensible \
  tpope/vim-git \
  tpope/vim-sleuth \
  tpope/vim-eunuch \
  tpope/vim-fugitive \
  tpope/vim-unimpaired \
  tpope/vim-afterimage \
  tpope/vim-abolish \
  tpope/vim-rake \
  tpope/vim-commentary \
  tpope/vim-rails \
  tpope/vim-repeat \
  tpope/vim-surround \
  tpope/vim-endwise \
  tpope/vim-ragtag \
  tpope/vim-bundler \
  tpope/vim-cucumber \
  tpope/vim-vividchalk \
  tpope/vim-fireplace \
  tpope/vim-classpath \
  tpope/vim-tbone \
  tpope/vim-dispatch \
  tpope/vim-vinegar \
  icymind/NeoSolarized \
  vim-airline/vim-airline \
  vim-airline/vim-airline-themes \
  ctrlpvim/ctrlp.vim \
  airblade/vim-gitgutter \
  janko-m/vim-test \
  airodactyl/neovim-ranger \
  roxma/vim-tmux-clipboard \
  neomake/neomake \
  mhinz/vim-grepper \
  Shougo/deoplete.nvim \
  Shougo/neco-syntax \
  ervandew/supertab
do
  PLUGIN=${REPO##*/}
  if [[ -a $PLUGINS$PLUGIN ]] 
  then echo "$PLUGIN found"
  else git submodule add https://github.com/$REPO.git $PLUGINS$PLUGIN
  fi
done

PLUGINS="vim/pack/plugins/start/"
git submodule init
for REPO in \
  jeetsukumaran/vim-buffergator \
  scrooloose/syntastic \
  mileszs/ack.vim \
  kana/vim-textobj-user \
  junegunn/vim-easy-align \
  andrewradev/switch.vim \
  tjennings/git-grep-vim \
  vim-scripts/DirDiff.vim \
  junegunn/goyo.vim \
  majutsushi/tagbar \
  schickling/vim-bufonly \
  kana/vim-textobj-indent \
  vim-ruby/vim-ruby \
  nelstrom/vim-textobj-rubyblock \
  ecomba/vim-ruby-refactoring \
  danchoi/ri.vim \
  mattn/emmet-vim \
  ekalinin/Dockerfile.vim \
  pangloss/vim-javascript \
  cakebaker/scss-syntax.vim \
  groenewege/vim-less \
  othree/html5.vim \
  kchmck/vim-coffee-script \
  leafgarland/typescript-vim \
  nono/vim-handlebars \
  slim-template/vim-slim \
  fatih/vim-go \
  chrisbra/csv.vim \
  plasticboy/vim-markdown \
  vim-pandoc/vim-pandoc \
  rhysd/vim-crystal \
  jvirtanen/vim-octave
do
  PLUGIN=${REPO##*/}
  if [[ -a $PLUGINS$PLUGIN ]] 
  then echo "$PLUGIN found"
  else git submodule add https://github.com/$REPO.git $PLUGINS$PLUGIN
  fi
done

for FILE in vimrc tmux.conf bash_profile bashrc profile ackrc vim gitignore inputrc psqlrc jshintrc gemrc
do
  if [ -a $HOME/.${FILE} ]
  then echo ".$FILE found, doing nothing"
  else ln -sf $DIR/$FILE $HOME/.$FILE && echo ".$FILE installed"
  fi
done

mkdir -p $HOME/.config

for FILE in liquidpromptrc nvim
do
  if [ -a $HOME/.config/${FILE} ]
  then echo "$FILE found, doing nothing"
  else ln -sf $DIR/$FILE $HOME/.config/$FILE && echo "$FILE installed"
  fi
done

mkdir -p $HOME/.config/ranger

for FILE in commands.py commands_full.py rc.conf rifle.conf scope.sh
do
  if [ -a $HOME/.config/ranger/${FILE} ]
  then echo "$FILE found, doing nothing"
  else ln -sf $DIR/$FILE $HOME/.config/ranger/$FILE && echo "$FILE installed"
  fi
done

# gitconfig
if [ -a $HOME/.gitconfig ]
then echo ".gitconfig found, doing nothing"
else
  if [[ -z "$NAME" ]]
  then read -p "Name " name
  else name=$NAME
  fi

  if [[ -z "$EMAIL" ]]
  then read -p "Email " email
  else email=$EMAIL
  fi

  if [[ -z "$GITHUB" ]]
  then read -p "Github username " github
  else github=$GITHUB
  fi

  if [[ -z "$GPGKEY" ]]
  then read -p "GPG key" gpgkey
  else gpgkey=$GPGKEY
  fi

  # escape strings for sed
  name=$(printf "%s\n" "$name" | sed 's/[\&/]/\\&/g')
  email=$(printf "%s\n" "$email" | sed 's/[\&/]/\\&/g')
  github=$(printf "%s\n" "$github" | sed 's/[\&/]/\\&/g')
  home=$(printf "%s\n" "$HOME" | sed 's/[\&/]/\\&/g')
  gpgkey=$(printf "%s\n" "$gpgkey" | sed 's/[\&/]/\\&/g')

  # replace NAME, EMAIL, GITHUB, HOME
  sed "s/NAME/$name/g" $DIR/gitconfig | sed "s/EMAIL/$email/g" | sed "s/GPGKEY/$gpgkey/g" | sed "s/GITHUB/$github/g" | sed "s/HOME/$home/g" > $HOME/.gitconfig
  echo ".gitconfig installed"
fi
