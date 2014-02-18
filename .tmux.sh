#!/bin/sh
echo "Startup scrIPT FOR tmux."



tmux_zoom_path="https://github.com/jipumarino/tmux-zoom.git"



if ! [ -e ".tmux/scripts" ]; then
	echo "I must download scripts now!!!"
	mkdir ./.tmux/scripts -p
fi

if ! [ -e ".tmux/scripts/tmux-zoom" ]; then
	cd ".tmux/scripts/"
	git clone $tmux_zoom_path
fi
