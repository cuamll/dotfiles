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

plt() {
  if (( $# == 1 )) ; then
    output="$1.pdf"
  elif (( $# == 2 )) ; then
    output=$2
  else
    echo "too many arguments"
    exit 1
  fi
  python -c "from numpy import loadtxt; from matplotlib import pyplot; data = loadtxt('$1'); pyplot.plot(data[:,0], data[:,1]); pyplot.savefig('$output');" && open $output
}
