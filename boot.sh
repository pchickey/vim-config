#!/bin/zsh

if [[ ! -d bundle/Vundle.vim ]]; then
	git clone https://github.com/gmarik/vundle.git bundle/Vundle.vim
else
	cd bundle/Vundle.vim
	git pull
fi

vim +PluginInstall +qall
