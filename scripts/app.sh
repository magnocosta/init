#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No parameter provided. Please provide a function name."
    exit 1
fi

set_app_env() {
  opts=`echo "Dev Sandbox Stage Prod" | tr ' ' '\n'`
  app_env=`printf "$opts" | fzf --tmux center`
  # app_env=`printf "$opts" | fzf --tmux center | tr '[:upper:]' '[:lower:]'`
  # tmux send-keys "export APP_ENV=$app_env;direnv reload" C-m
}

function app_command() {
  case $1 in
    "env")
      set_app_env "$2" ;;
    *)
      echo "Function not recognized." ;;
  esac
}

