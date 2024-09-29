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

sanitizeString() {
  text=$1
  text=${text//-/ } # replacing "-" to " "
  text=${text//./ } # replacing "." to " "
  output=""
  for word in $text; do
    aux=`echo ${word:0:1} | tr '[a-z]' '[A-Z]'`${word:1}
    output+=" ${aux}"
  done
  echo $output
}

start_app() {
  parent=`basename $(dirname ${PWD})`
  parent=$(sanitizeString "$parent")

  name=`basename ${PWD}`
  name=$(sanitizeString "$name")

  session="$parent -> $name"
  tmuxinator s -n "$session" -p ~/.tmuxinator.yml
}

attach_session() {
  tmux attach #
}
