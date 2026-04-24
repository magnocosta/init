# Home and End  keys to move in terminal
bindkey '\e[H'    beginning-of-line
bindkey '\e[F'    end-of-line

# Base path
ZSH_CONFIG_DIR="$XDG_CONFIG_HOME/zsh"

# Load modular files
source "$ZSH_CONFIG_DIR/exports.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/plugins.zsh"

# Load modular apps
source "$ZSH_CONFIG_DIR/apps/fzf.zsh"
source "$ZSH_CONFIG_DIR/apps/eza.zsh"
source "$ZSH_CONFIG_DIR/apps/go.zsh"
source "$ZSH_CONFIG_DIR/apps/nvm.zsh"
source "$ZSH_CONFIG_DIR/apps/rvm.zsh"
source "$ZSH_CONFIG_DIR/apps/zoxide.zsh"

if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

eval "$(starship init zsh)"
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

