export ZSH="/home/dancer/.oh-my-zsh"

ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

fpath+=/home/dancer/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

alias 9="\9"
