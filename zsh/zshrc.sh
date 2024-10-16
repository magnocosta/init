if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/Users/$USER/.oh-my-zsh
export EDITOR='vim'

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  history
  macos
  sprunge
  colored-man-pages
  direnv
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $(brew --prefix zsh-autosuggestions)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Home and End  keys to move in terminal
bindkey '\e[H'    beginning-of-line
bindkey '\e[F'    end-of-line

# NVM
export NVM_HOMEBREW=$(brew --prefix nvm)
export NVM_DIR="$HOME/.nvm"
   [ -s "$NVM_HOMEBREW/nvm.sh" ] && \. "$NVM_HOMEBREW/nvm.sh"  # This loads nvm
   [ -s "$NVM_HOMEBREW/etc/bash_completion.d/nvm" ] && \. "$NVM_HOMEBREW/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# SDK-MAN
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"


export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/Users/$USER/go/bin:$PATH"
export DOTENV_PATH="/Users/$USER/.init"

alias vim=nvim
alias v=vim
alias la="tree -L 2"
alias laa="tree -L 3"
alias laaa="tree -L 4"
alias cat=bat
alias cl=clear
alias bruce="${DOTENV_PATH}/scripts/bruce.sh"
alias s="bruce tmux app"
alias a="bruce tmux attach"
alias b="bruce"

#export PATH="/usr/local/opt/mysql-client/bin:$PATH"
#export PATH="/usr/local/Caskroom/flutter/3.10.5/flutter/bin:$PATH"
# export PATH="/Users/$USER/.init/scripts:$PATH"

# RVM
# source $HOME/.rvm/scripts/rvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
