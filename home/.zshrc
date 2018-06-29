# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="minimal"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git python common-aliases)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/Users/cgray/anaconda3/bin:/opt/texbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH="/usr/local/include:$PATH"

export EDITOR='vim'

# Personal aliases
source $HOME/.aliases

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
homeshick --quiet refresh
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

if [[ "$OSTYPE" == "darwin"* ]]; then
    export DEFAULT_USER=cgray
    export PATH=/Users/cgray/anaconda3/bin:/opt/local/bin:/opt/local/sbin:/opt/local:/usr/texbin:/Library/TeX/texbin:$PATH
    # export PYTHONPATH="/opt/local/Library/Frameworks/Python.framework:$PYTHONPATH"
    export PYTHONPATH="/Users/cgray/anaconda3/bin:$PYTHONPATH"
fi

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
