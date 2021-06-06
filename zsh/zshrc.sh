if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/Users/magnocosta/.oh-my-zsh
export EDITOR='vim'

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git 
  history
  osx
  sprunge
  sublime
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# SDK-MAN
export SDKMAN_DIR="/Users/magnocosta/.sdkman"
[[ -s "/Users/magnocosta/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/magnocosta/.sdkman/bin/sdkman-init.sh"


alias ctags_js='ln -s ~/.init/ctags/javascript/ctagsrc "$(pwd)"/.ctags'
