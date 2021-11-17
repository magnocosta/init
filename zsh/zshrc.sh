if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=/Users/magnocosta/.oh-my-zsh
export EDITOR='vim'

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  history
  macos
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
alias ctags_terraform='ln -s ~/.init/ctags/terraform/ctagsrc "$(pwd)"/.ctags'
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"

start_tmux_project() {
  parent=`basename $(dirname ${PWD})`
  parent=${(C)parent}
  parent=${parent//-/ }
  
  name=`basename ${PWD}`
  name=${(C)name}
  name=${name//-/ }
  
  session="$parent -> $name"

  echo "$session"
  echo `tmuxinator s -n "$session" -p ~/.tmuxinator.yml`
}

attach_tmux() {
  echo `tmux attach #`
}

# alias mux='tmuxinator s -n "`basename $(pwd)`" -p ~/.tmuxinator.yml'
alias s=start_tmux_project
alias a=attach_tmux

export GOPATH="$HOME/go"
# export GOROOT="/usr/local/bin/"

export PATH="$GOPATH/bin:$PATH"
