#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

PLUGINS="vim/pack/plugins/start/"
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
  jeetsukumaran/vim-buffergator \
  scrooloose/syntastic \
  mileszs/ack.vim \
  kana/vim-textobj-user \
  junegunn/vim-easy-align \
  andrewradev/switch.vim \
  airblade/vim-gitgutter \
  vim-airline/vim-airline \
  vim-airline/vim-airline-themes \
  tjennings/git-grep-vim \
  ervandew/supertab \
  vim-scripts/DirDiff.vim \
  junegunn/goyo.vim \
  majutsushi/tagbar \
  schickling/vim-bufonly \
  kana/vim-textobj-indent \
  janko-m/vim-test \
  altercation/vim-colors-solarized \
  shougo/unite.vim \
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
  nono/vim-handlebars \
  fatih/vim-go \
  chrisbra/csv.vim \
  plasticboy/vim-markdown \
  vim-pandoc/vim-pandoc \
  rhysd/vim-crystal \
  jvirtanen/vim-octave
do
  PLUGIN=${REPO##*/}
  if [[ -a $PLUGINS/$PLUGIN ]] 
  then echo "$PLUGIN found"
  else git submodule add https://github.com/$REPO.git $PLUGINS/$PLUGIN
  fi
done
echo "Updating all submodules ..."
git submodule update --remote --merge

mkdir -p $HOME/.config

for FILE in vimrc tmux.conf bash_profile bashrc profile ackrc vim gitignore inputrc psqlrc jshintrc gemrc
do
  if [ -a $HOME/.${FILE} ]
  then echo ".$FILE found, doing nothing"
  else ln -sf $DIR/$FILE $HOME/.$FILE && echo ".$FILE installed"
  fi
done

for FILE in liquidpromptrc
do
  if [ -a $HOME/.config/${FILE} ]
  then echo ".$FILE found, doing nothing"
  else ln -sf $DIR/$FILE $HOME/.config/$FILE && echo ".$FILE installed"
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

  # escape strings for sed
  name=$(printf "%s\n" "$name" | sed 's/[\&/]/\\&/g')
  email=$(printf "%s\n" "$email" | sed 's/[\&/]/\\&/g')
  github=$(printf "%s\n" "$github" | sed 's/[\&/]/\\&/g')
  home=$(printf "%s\n" "$HOME" | sed 's/[\&/]/\\&/g')

  # replace NAME, EMAIL, GITHUB, HOME
  sed "s/NAME/$name/g" $DIR/gitconfig | sed "s/EMAIL/$email/g" | sed "s/GITHUB/$github/g" | sed "s/HOME/$home/g" > $HOME/.gitconfig
  echo ".gitconfig installed"
fi
