set fish_greeting

set -l eza_available (which eza)
if test -n "$eza_available"
    alias ls="eza --bytes --git --group-directories-first"
end

alias la="ls -lha"
alias df="df -h"
alias du="du -ch"
alias tcpd="sudo tcpdump -A -s 10240 'tcp port 4080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | grep -E --line-buffered '^........(GET |HTTP/|POST |HEAD )|^[A-Za-z0-9-]+: ' | sed -r 's/^........(GET |HTTP\/|POST |HEAD )/\n\1/g'"
alias assume="source $HOME/.config/fish/assume.fish"

starship init fish | source
