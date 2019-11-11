#!/bin/bash

#Download Vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#install incosolato go font
wget -P /usr/share/fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/InconsolataGo/Bold/complete/InconsolataGo%20Bold%20Nerd%20Font%20Complete.ttf
