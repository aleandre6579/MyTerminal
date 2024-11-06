# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export BROWSER=wslview

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(docker git nvm ssh-agent)

source $ZSH/oh-my-zsh.sh
source ~/.profile

alias fork='/mnt/c/Windows/System32/cmd.exe /c "%USERPROFILE%\\AppData\Local\Fork\Fork.exe "$(wslpath -w -a .)'

alias ztheme='(){ export ZSH_THEME="$@" && source $ZSH/oh-my-zsh.sh }'
alias browse='explorer.exe'
alias penv="source ~/env/bin/activate"

alias z="fasd_cd -d"
alias k="kubectl"

alias docku="docker compose down && docker compose build && docker compose up"

# Git aliases
alias ga='git add --all'
gcmp() {
    git commit -m "$1"
    git push --force-with-lease origin
}
gacp() {
    git pull
    git add --all
    git commit -m "$1"
    git push --force-with-lease origin
}
alias gph="git push origin HEAD:main"

# initialize fasd
eval "$(fasd --init auto)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/alean/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/alean/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/alean/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/alean/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

