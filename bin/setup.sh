#!/bin/sh

set -e

# install packages
brew tap thoughtbot/formulae ;
brew install rcm ;
brew install neovim ;
brew install vim --with-override-system-vi ;
npm install --global pure-prompt ;

# use RCM to symlink dotfiles
env RCRC="$HOME"/dotfiles/rcrc rcup

# symlink vimrc to init.vim so vim/neovim share the same config
mkdir "$HOME"/.config/nvim/
ln -s "$HOME"/.vim "$HOME"/.config/nvim
ln -s "$HOME"/.vimrc "$HOME"/.config/nvim/init.vim

# download vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# run rcup again to make sure everything is linked properly and all plugins are
# installed
rcup
