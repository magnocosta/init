#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No parameter provided. Please provide a function name."
    exit 1
fi

case $1 in
    "aws")
      source ./scripts/aws.sh
      shift
      aws_command "$@"
      ;;
    "app")
      source ./scripts/app.sh
      shift
      app_command "$@"
      ;;
    *)
        echo "Function not recognized." ;;
esac
