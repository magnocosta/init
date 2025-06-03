#!/bin/bash

make_http_request() {
  local request_file="$1"

  if [ ! -f "$request_file" ]; then
    echo "Error: request file '$request_file' not found."
    return 1
  fi

  # Detect all ${VAR} used in the request file
  local vars
  vars=$(grep -o '\${[A-Z_][A-Z0-9_]*}' "$request_file" | tr -d '${}' | sort -u)

  # Prompt for values if not already set
  for var in $vars; do
    if [ -z "${!var}" ]; then
      read -rp "Enter value for $var: " value
      export "$var"="$value"
    fi
  done

  # Source the request definition (after env is populated)
  source "$request_file"

  if [ -z "$METHOD" ] || [ -z "$URL" ]; then
    echo "Error: METHOD and URL must be defined in the request file."
    return 1
  fi

  local curl_cmd="curl -s -X $METHOD"

  for header in "${HEADERS[@]}"; do
    curl_cmd+=" -H \"$header\""
  done

  if [ -n "$BODY" ]; then
    curl_cmd+=" -d '$BODY'"
  fi

  curl_cmd+=" \"$URL\""

  if [[ "$USE_JQ" == "true" ]]; then
    curl_cmd+=" | jq"
  fi

  if [[ "$ONLY_PRINT" == "true" ]]; then
    echo "$curl_cmd"
    return 0
  fi

  # echo -e "\n➡️  Executing request from: $request_file\n"
  eval "$curl_cmd"
}

postman() {
  local POSTMAN_PATH="${POSTMAN_PATH:-.}"

  find "." -type f -name "*.http" | \
    FZF_DEFAULT_OPTS="--preview-window=right:60%" \
    fzf --ansi \
    --prompt="Select a request to run: " \
    --preview 'bat --map-syntax="*.http:Bourne Again Shell (bash)" --theme="Solarized (dark)" --style=numbers --color=always --paging=never --line-range=:300 {}' \
    --bind "enter:execute(tmux split-window -h \"zsh -i -c 'source ~/.zshrc; export APP_ENV='\\\"${APP_ENV}\\\"';source <(direnv export zsh); echo 'reload'; http \\\"{}\\\"; echo Press enter to close...; read'\")" \
    --bind "ctrl-p:execute-silent(tmux send-keys -l 'http \"{}\"')+abort" \
    --bind "ctrl-e:become(nvim {})" \
    --bind "ctrl-d:become(
      dir=\$(dirname {});
      base=\$(basename {} .http);
      i=1;
      while [[ -e \$dir/\${base}-copy\$i.http ]]; do ((i++)); done;
        new_file=\$dir/\${base}-copy\$i.http;
        cp {} \$new_file;
        nvim \$new_file
        )" 
}
