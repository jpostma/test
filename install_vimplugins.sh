#!/bin/bash
echo "Installing favorite vim plugins"


InstallVimPlugins() {
	echo "install now"

	read -p "Do you want to install Pathogen?" -n 1 -r echo
	if [[  $REPLY =~ ^[Yy]$ ]]
	then
		echo "installing pathogen."
		mkdir ~/.vim/bundle ~/.vim/autoload -p
		
		cd ~/.vim/auload
		curl -Sso $HOME/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
				
		cd ~/.vim/bundle
		git clone https://github.com/tomtom/tlib_vim.git
		git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
		git clone https://github.com/garbas/vim-snipmate.git
		git clone https://github.com/honza/vim-snippets.git
		git clone https://github.com/scrooloose/nerdtree.git
	fi

	read -p "Do you want to install NERDtree?" -n 1 -r echo
	if [[  $REPLY =~ ^[Yy]$ ]]
	then
		echo "installing NERDtree."
	fi	





}

InstallVimPlugins
