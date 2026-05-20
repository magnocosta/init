# Home and End  keys to move in terminal
bindkey '\e[H'    beginning-of-line
bindkey '\e[F'    end-of-line

# Base path
ZSH_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

# Load modular files
source "$ZSH_CONFIG_DIR/exports.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/plugins.zsh"

# It is really importarnt to load Brew first than other 
# apps because of the Brew path used.
# If Brew doens't exists like in Omarchy, the file below
# will skip silently
source "$ZSH_CONFIG_DIR/apps/brew.zsh"

# Load modular apps 
source "$ZSH_CONFIG_DIR/apps/fzf.zsh"
source "$ZSH_CONFIG_DIR/apps/eza.zsh"
source "$ZSH_CONFIG_DIR/apps/go.zsh"
source "$ZSH_CONFIG_DIR/apps/nvm.zsh"
source "$ZSH_CONFIG_DIR/apps/rvm.zsh"
source "$ZSH_CONFIG_DIR/apps/zoxide.zsh"
source "$ZSH_CONFIG_DIR/apps/starship.zsh"
