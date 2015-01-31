## LANG
export LANG=ja_JP.UTF-8

## PATH
# homebrew
export PATH=/usr/local/bin:$PATH
# texlive
export PATH=/usr/local/texlive/2014/bin/x86_64-darwin:$PATH

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

## cron
#alias crontab -e="export EDITOR=/usr/local/bin/vim; crontab -e"
##vi
alias vi="vim -u NONE --noplugin"

## Virtualbox
alias startVM_CUBE="VBoxManage startvm "CentCube6.6" --type headless"
alias stopVM_CUBE="VBoxManage controlvm CentCube6.6 poweroff"
alias runlistVM="VBoxManage list runningvms"