dotfiles
========

Work dotfiles.

For homeshick if necessary:

```bash
git clone https://github.com/andsens/homeshick $HOME/.homesick/repos/homeshick
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
source $HOME/.bashrc
homeshick clone cuamll/dotfiles
homeshick link dotfiles
```

`.zshrc`: Install [oh-my-zsh](robbyrussell/oh-my-zsh) first, then it should all work.
`.vimrc`: Install [vim-plug](junegunn/vim-plug), then `:PlugInstall` to install the rest.
I also clone [gnuplot-palettes](Gnuplotting/gnuplot-palettes) to `~/.config/gnuplot` then load it in `.gnuplot` to have colour schemes available.
