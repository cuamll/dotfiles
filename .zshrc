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

export PATH="//usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/callum/texlive"
export PATH="/usr/local/include:$PATH"

export EDITOR='vim'

# Personal aliases
source $HOME/.aliases

# source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# homeshick --quiet refresh
# fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# gnuplot -- plot to latex and compile to pdf
# add "keep" as third argument to keep aux files
# otherwise the function deletes them
plt() {
  gnuplot -e "OUTPUT='$2.tex'" "$1"
  latex "$2".tex
  dvips "$2".dvi
  ps2pdf "$2".ps
  if [[ "$3" != "keep" ]]; then
    rm -f "$2".log "$2".aux "$2".dvi "$2".ps "$2"-inc.eps
  fi
}
