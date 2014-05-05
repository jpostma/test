#!/bin/bash
echo "Installing favorite vim plugins"


InstallVimPlugins() {
	echo "install now"

	echo "installing pathogen."
	mkdir $HOME/.vim/bundle -p
	mkdir $HOME/.vim/autoload -p

	cd $HOME/.vim/autoload
	curl -L https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim

	echo "Installing lots of other plugins..."
	cd $HOME/.vim/bundle
	git clone https://github.com/tomtom/tlib_vim.git
	git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
	git clone https://github.com/garbas/vim-snipmate.git
	git clone https://github.com/honza/vim-snippets.git
	git clone https://github.com/scrooloose/nerdtree.git
	git clone https://github.com/jistr/vim-nerdtree-tabs.git
	git clone git://github.com/tpope/vim-commentary.git
	git clone https://gitjjjhub.com/scrooloose/syntastic.git
	git clone https://github.com/xieyu/pyclewn.git
	git clone https://github.com/vim-scripts/ctags.vim.git
	git clone https://github.com/kien/ctrlp.vim.git
	git clone https://github.com/Rip-Rip/clang_complete.git
	git clone https://github.com/dantler/vim-alternate.git
	git clone https://github.com/Lokaltog/vim-easymotion.git
	git clone https://github.com/jlanzarotta/bufexplorer.git
	git clone https://github.com/fholgado/minibufexpl.vim.git
	git clone https://github.com/yssl/QFEnter.git
	git clone https://github.com/vim-scripts/Conque-GDB.git
	echo "Done!"

	for i in $HOME/.vim/bundle/*; do
		pushd $i
		git pull
		popd
	done


	cd $HOME/.vim/bundle/clang_complete
	make install
}

InstallVimPlugins

# mkdir $HOME/.vim/colors -p
# cd $HOME/.vim/colors
# curl https://github.com/croaker/mustang-vim/blob/master/colors/mustang.vim
