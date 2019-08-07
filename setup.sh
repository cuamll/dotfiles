#!/bin/bash
# install oh-my-zsh, vim-plug, gnuplot-palettes, then do symlinks

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# gnuplot palettes
git clone https://github.com/gnuplotting/gnuplot-palettes $HOME/.config/gnuplot

./symlink.sh

chsh -s "$(which zsh)"
