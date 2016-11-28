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
	git clone --recursive https://github.com/tomtom/tlib_vim.git
	git clone --recursive https://github.com/MarcWeber/vim-addon-mw-utils.git
	git clone --recursive https://github.com/garbas/vim-snipmate.git
	git clone --recursive https://github.com/honza/vim-snippets.git
	git clone --recursive https://github.com/scrooloose/nerdtree.git
	git clone --recursive https://github.com/jistr/vim-nerdtree-tabs.git
	git clone --recursive git://github.com/tpope/vim-commentary.git
	git clone --recursive https://github.com/scrooloose/syntastic.git
	#git clone --recursive https://github.com/xieyu/pyclewn.git
	git clone --recursive https://github.com/vim-scripts/ctags.vim.git
	git clone --recursive https://github.com/kien/ctrlp.vim.git
	rm ~/.vim/bundle/clang_complete -rf
	git clone --recursive https://github.com/Rip-Rip/clang_complete.git
	git clone --recursive https://github.com/dantler/vim-alternate.git
	git clone --recursive https://github.com/Lokaltog/vim-easymotion.git
	git clone --recursive https://github.com/jlanzarotta/bufexplorer.git
	git clone --recursive https://github.com/fholgado/minibufexpl.vim.git
	git clone --recursive https://github.com/yssl/QFEnter.git
	git clone --recursive https://github.com/vim-scripts/Conque-GDB.git
	git clone --recursive https://github.com/davidhalter/jedi-vim.git
	echo "Done!"

	for i in $HOME/.vim/bundle/*; do
		pushd $i
		git pull
		git submodule update --init --recursive
		popd
	done


	cd ~/.vim/bundle/clang_complete
	make install
}

if ! [ -x /usr/bin/make ]; then
	echo Make is not installed!
elif ! [ -x /usr/bin/git ]; then
	echo Git is not installed!
elif ! [ -x /usr/bin/curl ]; then
	echo curl is not installed!
else
	InstallVimPlugins
fi

# mkdir $HOME/.vim/colors -p
# cd $HOME/.vim/colors
# curl https://github.com/croaker/mustang-vim/blob/master/colors/mustang.vim
