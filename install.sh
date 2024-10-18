#!/bin/bash

function relink() {
	rm -i $1
	ln -sn $2 $1
}

DOTFILES=$(pwd)

cd

relink .vimrc $DOTFILES/vimrc
relink .vim $DOTFILES/vim
relink .gitconfig $DOTFILES/gitconfig
relink .screenrc $DOTFILES/screenrc
relink .commonsh $DOTFILES/commonsh
relink .bash $DOTFILES/bash
relink .bashrc $DOTFILES/bashrc
relink .zshrc $DOTFILES/zshrc
relink .bash_profile $DOTFILES/bash_profile
relink .octaverc $DOTFILES/octaverc
relink .ackrc $DOTFILES/ackrc
relink .pryrc $DOTFILES/pryrc
relink .pythonrc $DOTFILES/pythonrc
relink .ghci $DOTFILES/ghci
relink .ideavimrc $DOTFILES/ideavimrc
