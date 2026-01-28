# Enviroment
export LANG=ja_JP.UTF-8
eval "$(/opt/homebrew/bin/brew shellenv)"

# alias
alias ls='ls -G'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias vi='vim'
alias kubectl='kubecolor'
alias k='kubecolor'
alias j='git'
alias m='mise'
alias code='cursor'
alias ip='ipconfig getifaddr en0'

export "PATH=${HOME}/.local/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"

# History File
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
setopt hist_ignore_all_dups
setopt hist_save_nodups
setopt hist_ignore_space
setopt hist_reduce_blanks
bindkey '^R' history-incremental-pattern-search-backward

# cd & ls
function chpwd() { ls }

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit -u
source <(kubectl completion zsh)
source <(stern --completion=zsh)

# krew
export "PATH=${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Prompt
PROMPT="%F{green}[%n@%m]%f %~ %# "

# vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

# custom configure
if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# 1password
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# mise
# https://mise.jdx.dev/getting-started.html#_2a-activate-mise
eval "$(mise activate zsh)"
eval "$(mise activate --shims)"

eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# bun
[ -s "${HOME}/.bun/_bun" ] && source "${HOME}/.bun/_bun"
export "PATH=${HOME}/.bun/bin:$PATH"
