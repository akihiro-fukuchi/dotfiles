# Enviroment
export LANG=ja_JP.UTF-8

# golang
# https://github.com/syndbg/goenv
export GO111MODULE=on
export PATH="$HOME/.goenv/bin:$PATH"
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# python
# https://github.com/pyenv/pyenv#installation
# https://github.com/pyenv/pyenv-virtualenv#installing-with-homebrew-for-macos-users
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# paths
export "PATH=/usr/local/opt/mysql-client@5.7/bin:$PATH"

# alias
alias ls='ls -G'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias vi='vim'
alias k='kubectl'
alias ij='idea'
alias rand='() { openssl rand -base64 256 | fold -w ${1:-16} | head -n1}'
alias kctx='kubectx'
alias kns='kubens'

kmerge () {
    tmpfile=$(mktemp)
    cat - | docker run --rm -i karlkfi/yq -y '.users[0].name as $u|.clusters[0].name as $c|.users[0].name = $u+"@"+$c|.contexts[0].name = $u+"@"+$c|.contexts[0].context.user = $u+"@"+$c' > $tmpfile
    now=$(date '+%Y%m%d%H%M')
    cp $HOME/.kube/config $HOME/.kube/config_$now
    KUBECONFIG=$HOME/.kube/config_$now:$tmpfile kubectl config view --flatten > $HOME/.kube/config
}

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

# Prompt
# PROMPT="%F{green}[%n@%m]%f %~ %# "
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
source ~/.zshrc.local
