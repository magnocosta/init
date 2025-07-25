#!/bin/bash

POMODORO_SCRIPT="${DOTENV_PATH}/sketchybar/plugins/pomodoro.sh"

if [ $# -eq 0 ]; then
    echo "No parameter provided. Please provide a function name."
    exit 1
fi

function start() {
  echo "Starting Pomodoro timer for 25 minutes..."
  "${POMODORO_SCRIPT}" "1500"
}

function rest() {
  echo "Starting Pomodoro rest timer for 5 minutes..."
  "${POMODORO_SCRIPT}" "300"
}

function stop() {
  echo "Stopping Pomodoro timer..."
  "${POMODORO_SCRIPT}" "stop"
}

function pomodoro_command() {
  case $1 in
    "start")
      start "$2" ;;
    "stop")
      stop "$2" ;;
    "rest")
      rest "$2" ;;
    *)
      echo "Function not recognized." ;;
  esac
}

