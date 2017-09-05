ZSHRC=$(readlink "$HOME"/.zshrc)
ZSH_DIR=$(dirname "$ZSHRC")

export PATH="$HOME/.venv/bin:$HOME/bin:$HOME/Documents/go-zone/bin:$(brew --prefix go)/libexec/bin:$(brew --prefix gnu-sed)/libexec/gnubin:$(brew --prefix coreutils)/libexec/gnubin:$(brew --prefix findutils)/bin:$(brew --prefix ruby)/bin:/usr/local/share/npm/bin:/usr/local/sbin:/usr/local/bin:${PATH}"
export MANPATH="$(brew --prefix gnu-sed)/libexec/gnuman:$MANPATH"
export GOPATH="$HOME/Documents/go-zone"
export NODE_PATH="/usr/local/lib/node_modules"
export VBOX_DISK_SIZE=100000

# Homebrew cask aliases
alias cask_install="brew cask install --appdir=/Applications"
alias cask_uninstall="brew cask uninstall"
alias cask_search="brew cask search"
alias cask_list="brew cask list"
# Vagrant Aliases
# alias start-vm="VBoxManage startvm BC-docker-2016-04-10 --type headless"
alias stop-vm="VBoxManage controlvm BC-docker-2016-04-10 poweroff"
alias enter-vm="ssh vagrant@localhost -p 2222"
# Better ls alias for Mac
alias ls='ls -GpFh'

# My custom aliases
alias bc='cd ~/git/BriteCore/'
alias update_powertools='pip install -U git+ssh://git@github.com/IntuitiveWebSolutions/PowerTools.git'
alias update_gitiws='cd && ~/.venv/bin/pip install -U git+ssh://git@github.com/IntuitiveWebSolutions/Git-IWS.git'
alias devbrite='nocorrect devbrite '

PLUGINS=('vagrant' 'brew')
source "$ZSH_DIR/common.zsh"

# custom methods
function vimdatshit () {
    ag -l $1 $2 | xargs -o vim +/$1
}

function work-with () {
sequelpro $1 && ssh aws.$1-Leader
}

function start-vm () {
    if [ $# -ne 0 ]; then
        VBoxManage startvm BC-docker-2016-04-10
    else
        VBoxManage startvm BC-docker-2016-04-10 --type headless
    fi
}

function all_clients () {
    live-sites | jq ".[] .client_name" | tr -d '"'
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
