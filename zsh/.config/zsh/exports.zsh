export EDITOR='nvim'
export DOTENV_PATH="$HOME/.init"
export POSTMAN_PATH="$HOME/Work/tools/postman"
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

path=(
  "$HOME/.local/bin"
  $path
)
