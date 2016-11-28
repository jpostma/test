#!/bin/sh
echo "Startup script for tmux in "

if [ -z ${EDITOR+x} ]
then
   	echo "Rember to set the correct EDITOR={favourite editor} first"
	exit 1
fi

if ! [ -e "$HOME/.tmux/scripts" ]; then
	echo "I must download scripts now!!!"
	mkdir $HOME/.tmux/scripts -p
fi

if ! [ -e "$HOME/.tmux/scripts/tmux-zoom" ]; then
	cd "$HOME/.tmux/scripts/"
	git clone --recursive "https://github.com/jipumarino/tmux-zoom.git"
fi

if ! [ -e "$HOME/.tmux/scripts/tmux-powerline" ]; then
	cd "$HOME/.tmux/scripts/"
	git clone --recursive "https://github.com/erikw/tmux-powerline.git"
fi

if ! [ -e "$HOME/.tmux/scripts/tmuxinator" ]; then
	cd "$HOME/.tmux/scripts/"
	git clone --recursive "https://github.com/tmuxinator/tmuxinator.git"
fi
echo updating....

cd "$HOME/.tmux/scripts/tmux-zoom"
git submodule update --init --recursive

cd "$HOME/.tmux/scripts/tmux-powerline"
git submodule update --init --recursive

cd "$HOME/.tmux/scripts/tmuxinator"
git submodule update --init --recursive
echo Remember to add 'soure "/home/johan/.tmux/scripts/tmuxinator/completion/tmuxinator.[zsh/fish/bash]"' to your shell environment

if ! [ -e /usr/bin/gem ]; then
	echo "Couldn't find gem, you would probably need to install ruby >= 2.3/ruby-dev >= 2.3"
fi
