#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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
