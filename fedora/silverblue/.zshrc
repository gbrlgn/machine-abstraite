export ZSH="/var/home/dancer/.oh-my-zsh"

ZSH_THEME=""

plugins=(git)

source $ZSH/oh-my-zsh.sh

fpath+=/var/home/dancer/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
