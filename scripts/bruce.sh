#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No parameter provided. Please provide a function name."
    exit 1
fi

case $1 in
    "aws")
      source ${DOTENV_PATH}/scripts/aws.sh
      shift
      aws_command "$@"
      ;;
    "app")
      source ${DOTENV_PATH}/scripts/app.sh
      shift
      app_command "$@"
      ;;
    "tmux")
      source ${DOTENV_PATH}/scripts/tmux.sh
      shift
      tmux_command "$@"
      ;;
    *)
        echo "Function not recognized." ;;
esac
