alias ....="../../"
alias f="fzf"
alias la="ls -lha"
alias df="df -h"
alias du="du -ch"
alias tcpd="sudo tcpdump -A -s 10240 'tcp port 4080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | grep -E --line-buffered '^........(GET |HTTP/|POST |HEAD )|^[A-Za-z0-9-]+: ' | sed -r 's/^........(GET |HTTP\/|POST |HEAD )/\n\1/g'"
alias assume="source $HOME/.config/fish/assume.fish"

set fish_greeting

set -l eza_available (which eza)
if test -n "$eza_available"
    alias ls="eza --bytes --git --group-directories-first"
end

fzf --fish | source
set FZF_DEFAULT_OPTS "--preview 'bat --color=always {}'"
set FZF_DEFAULT_COMMAND "fd --type f"

fnm env --use-on-cd --shell fish | source

starship init fish | source
