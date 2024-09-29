#!/bin/bash

function tmux_command() {
  case $1 in
    "app")
     start_app ;;
    "attach")
      attach_session ;;
    *)
      echo "Function not recognized." ;;
  esac
}

start_app() {
  parent=`basename $(dirname ${PWD})`
  # parent=${(C)parent}
  parent=${parent//-/ }

  name=`basename ${PWD}`
  # name=${(C)name}
  name=${name//-/ }
  name=$(echo "$name" | sed 's/\.//g')

  session="$parent -> $name"

  echo "$session"
  echo `tmuxinator s -n "$session" -p ~/.tmuxinator.yml`
}

attach_session() {
  echo `tmux attach #`
}
