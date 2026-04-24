export EDITOR='nvim'
export DOTENV_PATH="$HOME/.init"
export POSTMAN_PATH="$HOME/Work/tools/postman"

export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

#export ZSH=$HOME/.oh-my-zsh
#export ZSH_CUSTOM="$ZSH/custom"
export ZSH_THEME="robbyrussell"

path=(
  "$HOME/.local/bin"
  $path
)

#export PATH="/usr/local/opt/mysql-client/bin:$PATH"
#export PATH="/usr/local/Caskroom/flutter/3.10.5/flutter/bin:$PATH"
# export PATH="/Users/$USER/.init/scripts:$PATH"
