#!/bin/bash

function relink() {
	rm -i $1
	ln -sn $2 $1
}

DOTFILES=$(pwd)

cd

relink .vimrc $DOTFILES/vimrc
relink .vim $DOTFILES/vim
