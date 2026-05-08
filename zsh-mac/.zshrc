export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="common"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Valgrind alternative for macOS
function leaks() {
 export MallocStackLogging=1
 command leaks --atExit -- "$@"
 unset MallocStackLogging
}

# [ -n "$TMUX" ] && export INSIDE_TMUX=1

bindkey '^H' backward-kill-word

#####################################################################
#                              ALIASES                              #
#####################################################################

alias python="python3"
alias pip="pip3"

# alias c="clear"
alias c="printf '\e[2J\e[3J\e[H'"
alias cls="c; ls"

alias o="open"
alias oo="open . 2>/dev/null"

alias gc="git checkout"
alias gp="git pull"
alias gs="git status"
alias gst="git stash"
alias grs="git reset --soft"
alias grh="git reset --hard"
unalias gaa

export DOCKER_DEFAULT_PLATFORM=linux/amd64
alias dc="docker compose"

alias nv="nvim"
alias vim="nvim"
alias vi="nvim"

alias fzf-wordlists="fzf --walker-root=$HOME/Documents/SecLists"

alias @ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias @mem="du -hsc * | sort -hr"

#####################################################################
#                                ENV                                #
#####################################################################

# export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"
# export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$HOME/Android/Sdk/emulator"
export PATH="$PATH:$HOME/.local/bin"

#####################################################################
#                                MISC                               #
#####################################################################

eval $(/opt/homebrew/bin/brew shellenv)
export PATH="$PATH:$HOME/.pyenv/shims"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# export CMAKE_PREFIX_PATH="/opt/homebrew/Cellar:${CMAKE_PREFIX_PATH}"

alias exegol-start='$HOME/Documents/exegol-start'
autoload -U compinit && compinit
eval "$(register-python-argcomplete --no-defaults exegol)"
