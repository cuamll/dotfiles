dotfiles
========

These are my dotfiles. They need a good sort out but mostly seem to work. Cloning andsens/homeshick and then running homeshick clone callumgray/dotfiles && homeshick link dotfiles should do the trick. It will also install robbyrussell/oh-my-zsh; this probably isn't needed since I haven't customised it enough to warrant cloning the whole thing, but it does make things a little easier. Obviously zsh needs to be installed if you want any of that stuff to work; might also want to set it as the default shell.

Run :PluginInstall in vim to make sure the plugins are installed, they should be already. YCM will need compiling; hope that it compiles against the same version of python that vim does, otherwise it'll be really annoying.

For terminator, the .terminator file probably won't link properly because terminator doesn't bother to look for ~/.terminatorrc or anything else obvious like that; link the dotfiles through homeshick first and then do 

ln -s ~/.terminator ~/.config/terminator/config 

or something like that. The link train is not hugely elegant but it works.

For Macs there's no terminator so just grab Solarized from Ethan Schooner's website and add the iterm2 colour scheme manually; iterm2 doesn't seem to bother with config files. To use the zsh theme listed in .zshrc, grab Sauce Code Powerline from lokaltog/powerline-fonts (adding the glyphs separately doesn't seem to work). Also on Macs /opt/local/(s)bin is added to the path so that port: command not found doesn't pop up every time.

Lastly for the .conkyrc get Noto Serif, which is free at google.com/fonts. anowplaying.py is just to grab music metadata from Clementine.
