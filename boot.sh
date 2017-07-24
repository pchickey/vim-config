#!/bin/zsh

if [[ ! -d bundle/Vundle.vim ]]; then
	git clone https://github.com/gmarik/vundle.git bundle/Vundle.vim
else
	cd bundle/Vundle.vim
	git pull
	cd ../..
fi

vim +PluginInstall +qall

if [[ -d bundle/YouCompleteMe ]]; then
	cd bundle/YouCompleteMe
	git submodule update --init --recursive
	./install.py --clang-completer --racer-completer
	cd ../..
fi

