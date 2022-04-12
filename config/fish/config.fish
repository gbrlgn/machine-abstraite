#! /bin/sh
set fish_greeting
export EDITOR=emacs
export LANG=pt_BR.UTF-8
export LC_CTYPE=pt_BR.UTF-8
source $HOME/.config/fish/shortcuts.fish
set -gx PATH $HOME/.local/bin /usr/local/bin $PATH

switch (uname)
case "*Darwin"
    alias lsblk="diskutil list"
    test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
case '*Linux'
    :
end

set -l exa_available (which exa)
if test -n "$exa_available"
    alias ls='exa --icons --git'
end

alias la='ls -lha'
alias df='df -h'
alias du='du -ch'
alias ipp='curl ipinfo.io/ip'
alias yh='yt-dlp --continue --no-check-certificate --format=bestvideo+bestaudio --exec="ffmpeg -i {} -c:a copy -c:v copy {}.mkv && rm {}"'
alias yd='yt-dlp --continue --no-check-certificate --format=bestvideo+bestaudio --exec="ffmpeg -i {} -c:v prores_ks -profile:v 1 -vf fps=25/1 -pix_fmt yuv422p -c:a pcm_s16le {}.mov && rm {}"'
alias ya='yt-dlp --continue --no-check-certificate --format=bestaudio -x --audio-format wav'

# THEME PURE #
set fish_function_path /home/gbrlgn/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/gbrlgn/.config/fish/functions/theme-pure/conf.d/pure.fish
