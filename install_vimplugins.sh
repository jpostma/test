#!/bin/bash
echo "Installing favorite vim plugins"


InstallVimPlugins() {
	echo "install now"

	read -p "Do you want to install Pathogen?" -n 1 -r echo
	if [[  $REPLY =~ ^[Yy]$ ]]
	then
		echo "installing pathogen."
		curl -Sso $HOME/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	fi

	read -p "Do you want to install Pathogen?" -n 1 -r echo
	if [[  $REPLY =~ ^[Yy]$ ]]
	then
		echo "installing pathogen."
		curl -Sso $HOME/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	fi





}

InstallVimPlugins
