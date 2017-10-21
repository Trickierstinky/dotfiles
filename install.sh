#!/bin/bash

set +e

# Fetch the code from the other Git repos like zsh-git-prompt, Vim vundle...
git submodule update --remote --init

# Create the symlinks in $HOME
function link_if_missing() {
  SRC=$1
  DEST=$2

  if ! [ -L $DEST ]; then
    ln -ivs $SRC $DEST
  else
    echo "Skipping, link already exists: $DEST"
  fi
}

link_if_missing $PWD/bin                    $HOME/bin
link_if_missing $PWD/bash                   $HOME/.bash
link_if_missing $PWD/zsh                    $HOME/.zsh
link_if_missing $PWD/vim                    $HOME/.vim
link_if_missing $PWD/vim/bundles.vim  
link_if_missing $PWD/bashrc                 $HOME/.bashrc
link_if_missing $PWD/ackrc                  $HOME/.ackrc
link_if_missing $PWD/gitconfig              $HOME/.gitconfig
link_if_missing $PWD/gitignore              $HOME/.gitignore
link_if_missing $PWD/imwheelrc              $HOME/.imwheelrc
link_if_missing $PWD/irbrc                  $HOME/.irbrc
link_if_missing $PWD/plsqlrc                $HOME/.plsqlrc
link_if_missing $PWD/tmux.conf              $HOME/.tmux.conf
link_if_missing $PWD/vimrc                  $HOME/.vimrc
link_if_missing $PWD/zshrc                  $HOME/.zshrc


# Install vim plugins using Vundle
vim +PluginInstall +qall
