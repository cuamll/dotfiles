dotfiles
========

dryas dotfiles. Clone, cd into clone directory and do `./symlink.sh` to symlink them all into `$HOME`.

`.zshrc` assumes [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) is installed.  
`.vimrc` assumes [vim-plug](https://github.com/junegunn/vim-plug) is installed; just run `:PlugInstall` once that's done. 
`.gnuplot` benefits from cloning [gnuplot-palettes](https://github.com/Gnuplotting/gnuplot-palettes) to `~/.config/gnuplot` to make various preset colour schemes available.  
To do all of this at once (installations, symlinks, `chsh`) just run `./setup.sh`.
