export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_COMPLETION_TRIGGER='**'
export FZF_CTRL_T_OPTS="
 --walker-skip .git,node_modules,target
 --preview 'bat --color=always --style=numbers --line-range=:500 {}'
 --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# source "/usr/local/opt/fzf/shell/completion.zsh"
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"
