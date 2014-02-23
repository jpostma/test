#!/bin/bash
echo "Installing favorite vim plugins"


InstallVimPlugins() {
	echo "install now"

	echo "installing pathogen."
	mkdir $HOME/.vim/bundle -p
	mkdir $HOME/.vim/autoload -p

	cd $HOME/.vim/autoload
	curl -Sso $HOME/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

	echo "Installing lots of other plugins..."
	cd $HOME/.vim/bundle
	git clone https://github.com/tomtom/tlib_vim.git
	git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
	git clone https://github.com/garbas/vim-snipmate.git
	git clone https://github.com/honza/vim-snippets.git
	git clone https://github.com/scrooloose/nerdtree.git
	git clone git://github.com/tpope/vim-commentary.git
	git clone https://github.com/scrooloose/syntastic.git
	echo "Done!"
}

InstallVimPlugins
