export ZSH="/home/calabar/.oh-my-zsh"

ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

fpath+=/home/calabar/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
