alias ....="cd ../../"
alias ......="cd ../../../"
alias fcd="cd (dirname (fd --type file | fzf))"
alias la="ls -lha"
alias df="df -h"
alias du="du -ch"
alias tcpd="sudo tcpdump -A -s 10240 'tcp port 4080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | grep -E --line-buffered '^........(GET |HTTP/|POST |HEAD )|^[A-Za-z0-9-]+: ' | sed -r 's/^........(GET |HTTP\/|POST |HEAD )/\n\1/g'"
alias assume="source $HOME/.config/fish/assume.fish"

bind alt-backspace backward-kill-word

set fish_greeting

set -l eza_available (which eza)
if test -n "$eza_available"
    alias ls="eza --bytes --git --group-directories-first"
end

set -Ux FZF_DEFAULT_OPTS \
    "--color=fg:#8a7d70,bg:#121212,hl:#546f8a" \
    " --color=fg+:#beb1a4,bg+:#292828,hl+:#548a8a" \
    " --color=info:#8a6f54,prompt:#8a6054,pointer:#6f8a54" \
    " --color=marker:#8a5454,spinner:#8a546f,header:#548a8a"
set FZF_DEFAULT_COMMAND "fd --type f"

fnm env --use-on-cd --shell fish | source

starship init fish | source
