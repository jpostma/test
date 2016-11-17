#!/bin/sh
echo "Startup script for tmux in "



#tmux_zoom_path="



if ! [ -e "$HOME/.tmux/scripts" ]; then
	echo "I must download scripts now!!!"
	mkdir $HOME/.tmux/scripts -p
fi

if ! [ -e "$HOME/.tmux/scripts/tmux-zoom" ]; then
	cd "$HOME/.tmux/scripts/"
	git clone "https://github.com/jipumarino/tmux-zoom.git"
fi

if ! [ -e "$HOME/.tmux/scripts/tmux-powerline" ]; then
	cd "$HOME/.tmux/scripts/"
	git clone "https://github.com/erikw/tmux-powerline.git"
fi
