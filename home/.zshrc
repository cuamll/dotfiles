# Path to your oh-my-zsh installation.
export ZSH="/home/callum/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="minimal"

export EDITOR='vim'

export DEFAULT_USER=cgray
export PATH=/Users/cgray/anaconda3/bin:/opt/local/bin:/opt/local/sbin:/opt/local:/usr/texbin:/Library/TeX/texbin:$PATH
export PYTHONPATH="/Users/cgray/anaconda3/bin:$PYTHONPATH"

# gnuplot -- plot to latex and compile to pdf
# add "keep" as final argument to keep aux files
# otherwise the function deletes them
plt() {
  gnuplot -e "OUTPUT='$2.tex'; FILE='$2.dat'; PLOTTITLE='$3'; LINETITLE='$4'; XLABEL='$5'; YLABEL='$6'" "$1"
  latex "$2".tex
  dvips "$2".dvi
  ps2pdf "$2".ps
  if [[ "$7" != "keep" ]]; then
    rm -f "$2".log "$2".aux "$2".dvi "$2".ps "$2"-inc.eps
  fi
}

plt_gen() {
  gnuplot -e "OUTPUT='$2.tex'; FILE='$2.dat'; $3" "$1"
  latex "$2".tex
  dvips "$2".dvi
  ps2pdf "$2".ps
  if [[ "$4" != "keep" ]]; then
    rm -f "$2".log "$2".aux "$2".dvi "$2".ps "$2"-inc.eps
  fi
}

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Personal aliases, otherwise they get overwritten in oh-my-zsh.sh
source $HOME/.aliases

