set fish_greeting

export EDITOR=emacs
export LANG=pt_BR.UTF-8
export LC_CTYPE=pt_BR.UTF-8

set -l eza_available (which eza)

if test -n "$eza_available"
  alias ls="eza --bytes --git --group-directories-first --no-icons"
end

alias la="ls -lha"
alias df="df -h"
alias du="du -ch"

starship init fish | source
