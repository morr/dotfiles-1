#!/bin/bash

echo ==========================================================================
echo SYMLINKING...
echo ==========================================================================

files=(
  .config/mc
  .config/mpv
  .local/share/mc/skins
  .oh-my-zsh/custom/themes
  .ssh/config
  .vim
  scripts
  .agignore
  .ctags
  .gitconfig
  .gitignore
  .powconfig
  .pryrc
  .vimrc
  .zlogin
  .zshenv
  .zshrc
)

# http://misc.flogisoft.com/bash/tip_colors_and_formatting
RED_FG="\033[31m"
LIGHT_GREEN_FG="\033[92m"
RESET_ALL="\033[0m"

for file in "${files[@]}"; do
  echo "symlinking $PWD/$file to $HOME/$file"

  if [ -e "$HOME/$file" ]; then
    read -p "$HOME/$file exists - remove it? [yn] " yn

    if [ $yn = 'y' ]; then
      rm -rf "$HOME/$file"
      if [ $? -eq 0 ]; then
        echo -e "[$LIGHT_GREEN_FG OK $RESET_ALL] $file removed"
      else
        echo -e "[$RED_FG FAIL $RESET_ALL] failed to remove $file"
      fi
    fi
  fi

  target_dir=`dirname "$file"`
  ln -s "$PWD/$file" "$HOME/$target_dir"

  if [ $? -eq 0 ]; then
    echo -e "[$LIGHT_GREEN_FG OK $RESET_ALL] $file symlinked"
  else
    echo -e "[$RED_FG FAIL $RESET_ALL] failed to symlink $file"
  fi

  echo
done

echo --------------------------------------------------------------------------
echo SYMLINKING DONE
echo --------------------------------------------------------------------------

echo ==========================================================================
echo COPYING FONTS...
echo ==========================================================================

cp -R Library/Fonts/ ~/Library/Fonts/

echo --------------------------------------------------------------------------
echo FONTS COPIED
echo --------------------------------------------------------------------------