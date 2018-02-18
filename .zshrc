## LANG
export LANG=ja_JP.UTF-8

## ls colors
export LSCOLORS=gxfxcxdxbxegedabagacad

# Autostart if not already in tmux.
if [[ ! -n $TMUX ]]; then
  tmux new-session
fi

## PATH
# Anaconda3
export PATH="/opt/anaconda3/bin:$PATH"

# Cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda:$LD_LIBRARY_PATH

# Vivado
source /opt/Xilinx/Vivado/2017.4/settings64.sh

# editor
export EDITOR=/usr/local/bin/vim

#key bind
bindkey -e

## COMPINIT
autoload -U compinit
compinit
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## PROMPT
case ${UID} in
0)
    PROMPT="%B%{[32m%}[%n@%m]$ %{[m%}%b"
    RPEOMPT="%B%{[32m%}[%~] %{m%}%b"
    setopt transient_rprompt
    ;;

*)
    PROMPT="%{[32m%}[%n@%m]$ %{[m%}"
    RPROMPT="%{[32m%}[%~] %{[m%}"
    setopt transient_rprompt
    ;;
esac

## ALIAS
# ls
case "${OSTYPE}" in
darwin*)
    alias ls="ls -G"
    alias lt="ls -ltG"
    alias la="ls -aG"
    ;;
linux*)
    alias ls='ls --color'
    alias lt='ls -l --color'
    alias la='ls -a --color'
    ;;
esac

# export PKG_CONFIG_PATH=$PKG_COFIG_PATH:$HOME/opencv/lib/pkgconfig
# exporrt LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opencv/lib
#

## cron
#alias crontab -e="export EDITOR=/usr/local/bin/vim; crontab -e"

## g++
alias g++="g++ -std=c++11"

##vi
alias vi="vim -u NONE --noplugin"
