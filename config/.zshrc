export ZSH="/home/danger/.oh-my-zsh"

ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

fpath+=/home/danger/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
