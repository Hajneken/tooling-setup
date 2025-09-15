# zmodload zsh/zprof

eval "$(starship init zsh)"

# ENV variables 
export ZSH="$HOME/.oh-my-zsh"

DISABLE_COMPFIX="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"

# differentiate autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f5f5f,underline"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# plugins=(zsh-autosuggestions)
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# lazyload nvm
# export NVM_DIR="$HOME/.nvm"
# alias nvm="unset -f nvm; . \"$NVM_DIR/nvm.sh\"; nvm"

source $ZSH/oh-my-zsh.sh

# lazyload fzf
if [[ $- == *i* ]]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# FZF 
# Enable Key Bindings for FZF on MAC
. /opt/homebrew/opt/fzf/shell/key-bindings.zsh 

# CTRL+T searches for files preview files with space
export FZF_CTRL_T_OPTS='--preview "bat --style numbers --color=always {}" --bind="space:toggle-preview" --preview-window=:hidden'
# ALT+C searches for directories to change into, preview directory tree structure with space
export FZF_ALT_C_OPTS='--preview="lsd --tree --depth 1 --icon=always --color=always {}" --bind="space:toggle-preview" --preview-window=:hidden'
# User configuration

# COLORS for manpages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# use like regular cat and ls
alias cat='bat --paging=never'
alias l='lsd -lag --header'
alias ls='lsd'
alias vim='nvim'
alias c="clear"
alias mc="mc --nosubshell"
alias grep="rg"
alias find='fd'
alias v='nvim'
alias k='kubectl'
alias docker='podman'

# https://github.com/rupa/z
. /opt/homebrew/etc/profile.d/z.sh

# to use with fzf we need to unalias z 
unalias z 2> /dev/null

z() {
  local dir=$(
    _z 2>&1 |
    fzf --height 40% --layout reverse --info inline --nth 2.. --tac --no-sort --query "$*" --accept-nth 2..
  ) && cd "$dir"
}

# vi bindings in shell 
bindkey -v
# just because it might be buggy  
export KEYTIMEOUT=1

# zprof