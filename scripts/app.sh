#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No parameter provided. Please provide a function name."
    exit 1
fi

function set_app_env() {
  opts=`echo "Dev Sandbox Stage Prod" | tr ' ' '\n'`
  app_env=`printf "$opts" | fzf --tmux center | tr '[:upper:]' '[:lower:]'`
  tmux send-keys "export APP_ENV=$app_env;direnv reload" C-m
}

function load_ssh_keys() {
  ssh_dir="$HOME/.ssh"
  keys=("bitbucket" "github" "gitlab")

  if [[ ! -d "$ssh_dir" ]]; then
    echo "SSH directory not found: $ssh_dir"
    return 1
  fi

  cd "$ssh_dir" || return 1

  for key in "${keys[@]}"; do
    echo "Adding $key..."
    ssh-add "$key"
  done

  cd - > /dev/null
}

function app_command() {
  case $1 in
    "env")
      set_app_env "$2" ;;
    "ssh")
      load_ssh_keys "$2" ;;
    *)
      echo "Function not recognized." ;;
  esac
}

