@echo off
echo "running vimmerge: " %*
SET base=%1
SET theirs=%2
SET yours=%3
SET merge=%4
gvim.exe -f -c "wincmd J" -d %merge% %theirs% %base% %yours%
