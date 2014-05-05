@echo off
echo "Installing favorite vim plugins for windows"


echo "install now"

mkdir "%ProgramFiles(x86)%\Vim\vimfiles\bundle"
mkdir "%ProgramFiles(x86)%\Vim\vimfiles\autoload"
echo "installing pathogen. %ProgramFiles(x86)%\Vim\vimfiles"
if exist "%ProgramFiles(x86)%\Vim\vimfiles\bundle" (
	pushd "%ProgramFiles(x86)%\Vim\vimfiles\autoload"
	@rem curl -Sso pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
	call curl -L https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim > pathogen.vim
	popd
)

if exist "%ProgramFiles(x86)%\Vim\vimfiles\autoload" (
	echo "Installing lots of other plugins..."
	pushd "%ProgramFiles(x86)%\Vim\vimfiles\bundle"
	git clone https://github.com/tomtom/tlib_vim.git
	git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
	git clone https://github.com/garbas/vim-snipmate.git
	git clone https://github.com/honza/vim-snippets.git
	git clone https://github.com/scrooloose/nerdtree.git
	git clone https://github.com/jistr/vim-nerdtree-tabs.git
	git clone git://github.com/tpope/vim-commentary.git
	git clone https://github.com/scrooloose/syntastic.git
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

	popd
)

@rem for i in $HOME/.vim/bundle/*; do
@rem 	pushd $i
@rem 	git pull
@rem 	popd
@rem done


@rem 	cd $HOME/.vim/bundle/clang_complete
@rem 	make install


@rem mkdir $HOME/.vim/colors -p
@rem cd $HOME/.vim/colors
@rem curl https://github.com/croaker/mustang-vim/blob/master/colors/mustang.vim
