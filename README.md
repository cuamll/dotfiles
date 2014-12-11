dotfiles
========

These are my dotfiles. They need a good sort out but mostly seem to work. 

```bash
git clone https://github.com/andsens/homeshick $HOME/.homesick/repos/homeshick
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
source $HOME/.bashrc
homeshick clone callumgray/dotfiles
homeshick link dotfiles
```

should do the trick. This will also install [oh-my-zsh](http://github.com/robbyrussell/oh-my-zsh), which probably isn't needed, but it does make things a little easier. Obviously zsh needs to be installed for any of that stuff to work; might also want to set it as the default shell. Adding the powerline glyphs from [powerline-fonts](http://github.com/lokaltog/powerline-fonts) is also necessary for the zsh theme and won't be done automatically.

Run :PluginInstall in vim to make sure the plugins are installed - they should be already. [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) will need compiling. Hope that it compiles against the same version of python that vim does, otherwise check its documentation for a workaround (possibly involves building from source and passing some extra arguments to cmake, can't remember).

For terminator, the .terminator file probably won't link properly because terminator doesn't bother to look for ~/.terminatorrc or anything else obvious like that; link the dotfiles through homeshick first and then do 

`ln -s ~/.terminator ~/.config/terminator/config`

or something like that. The link train is not hugely elegant but it works.

For Macs there's no terminator so just grab [Solarized](http://ethanschoonover.com/solarized) and add the iterm2 colour scheme manually; no automating of this either. To use the agnoster zsh theme listed in .zshrc, grab Sauce Code Powerline from [powerline-fonts](http://github.com/lokaltog/powerline-fonts) and open it with fontviewer, then change the font manually in iterm2 (adding the glyphs separately doesn't seem to work). Also on Macs /opt/local/(s)bin is added to the path so that `port: command not found` doesn't pop up every time.

Lastly for the .conkyrc get Noto Serif, which is free from [google](http://google.com/fonts). anowplaying.py was shamelessly stolen from [diadara](http://github.com/diadara/conky-clementine) and is just to grab music metadata from Clementine. It's been changed a bit, though, since the version from there doesn't seem to work (bus.get_object seems to point to the wrong thing).
