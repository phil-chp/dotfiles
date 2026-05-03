export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="common"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

function cat() {
    for file in "$@"; do
        if [ -f "$file" ]; then
            SIZE=$(wc -c < "$file")
            if [[ $SIZE -gt 500000 ]]; then
                echo -e "File $file is very large ($SIZE bytes).\nAre you sure you want to proceed? (y/N)"
                read answer
                if [[ $answer != "Y" && $answer != "y" ]]; then
                    echo "Aborted."
                    return
                fi
            fi
        fi
    done
    command cat "$@"
}

function leaks() {
 export MallocStackLogging=1
 command leaks --atExit -- "$@"
 unset MallocStackLogging
}
# alias vg="valgrind"

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
alias oo="open ."

export BAT_THEME='gruvbox-dark'
alias bat="bat --style=header,grid,header-filesize"

alias gc="git checkout"
alias gp="git pull"
alias gs="git status"
alias gst="git stash"
alias grs="git reset --soft"
alias grh="git reset --hard"
unalias gaa

export DOCKER_DEFAULT_PLATFORM=linux/amd64
alias dc="docker compose"

# alias k9sw="k9s --headless -n"
# alias k9sr="k9s --readonly --headless -n"

# alias e="emacs -nw"
alias nv="nvim"
alias vim="nvim"
alias vi="nvim"

alias recon-spider="python3 $HOME/Documents/3Programs/ReconSpider/ReconSpider.py"
alias fzf-wordlist="fzf --walker-root=$HOME/Documents/3Programs/SecLists"
alias ghidra="/opt/homebrew/bin/ghidraRun"

			 ###########################################

alias @whoami="$HOME/Documents/whoami.sh"

#####################################################################
#                                ENV                                #
#####################################################################

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:/opt/metasploit-framework/bin"
# export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/Library/Android/sdk/emulator"
export PATH="$PATH:$HOME/.local/bin"

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# source ~/.nvm/nvm.sh

eval $(/opt/homebrew/bin/brew shellenv)
export PATH="$PATH:$HOME/.pyenv/shims"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export CMAKE_PREFIX_PATH="/opt/homebrew/Cellar:${CMAKE_PREFIX_PATH}"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
#         . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# path=('/opt/homebrew/bin' $path)
# export PATH

# if [[ -n "$CONDA_SHLVL" ]]; then
#     export CONDACONFIGDIR=""
#     cd() { builtin cd "$@" &&
#     if [ -f $PWD/.conda_config ]; then
#         export CONDACONFIGDIR=$PWD
#         conda activate $(cat .conda_config)
#     elif [ "$CONDACONFIGDIR" ]; then
#         if [[ $PWD != *"$CONDACONFIGDIR"* ]]; then
#             export CONDACONFIGDIR=""
#             conda deactivate
#         fi
#     fi }
# fi

# # bun completions
# [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$PATH:$BUN_INSTALL/bin"
autoload -U compinit && compinit
eval "$(register-python-argcomplete --no-defaults exegol)"

alias exegol-start="/Users/phil/Documents/exegol-start"
