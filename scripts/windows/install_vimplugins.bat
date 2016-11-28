@echo off
setlocal enabledelayedexpansion
echo "Installing favorite vim plugins for windows"

if not exist "%USERPROFILE%/vimfiles\bundle" (
	mkdir "%USERPROFILE%/vimfiles\bundle"
)
if not exist "%USERPROFILE%/vimfiles\autoload" (
		mkdir "%USERPROFILE%/vimfiles\autoload"
)

echo "installing pathogen. %USERPROFILE%/vimfiles"
if exist "%USERPROFILE%/vimfiles\bundle" (
	pushd "%USERPROFILE%/vimfiles\autoload"
	call curl -L https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim
	popd
)

if exist "%USERPROFILE%/vimfiles\autoload" (
	echo "Installing lots of other plugins..."
	pushd "%USERPROFILE%/vimfiles\bundle"
	if not exist bufexplorer git clone https://github.com/jlanzarotta/bufexplorer.git
	if not exist ctrlp.vim git clone https://github.com/kien/ctrlp.vim.git
	if not exist minibufexpl.vim git clone https://github.com/fholgado/minibufexpl.vim.git

	if not exist tlib_vim git clone https://github.com/tomtom/tlib_vim.git
	if not exist vim-addon-mw-utils git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
	if not exist vim-snipmate git clone https://github.com/garbas/vim-snipmate.git
	if not exist vim-snippets git clone https://github.com/honza/vim-snippets.git
	if not exist nerdtree git clone https://github.com/scrooloose/nerdtree.git
	if not exist vim-nerdtree-tabs git clone https://github.com/jistr/vim-nerdtree-tabs.git
	@rem git clone git://github.com/tpope/vim-commentary.git
	if not exist pyclewn git clone https://github.com/xieyu/pyclewn.git
	if not exist vim-alternate git clone https://github.com/dantler/vim-alternate.git
	if not exist vim-easymotion git clone https://github.com/Lokaltog/vim-easymotion.git
	echo "Done!"

	popd
)
