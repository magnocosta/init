#!/bin/bash

SKETCHYBAR_ITEM_NAME="pomodoro"
SOUNDS_PATH="/System/Library/PrivateFrameworks/ScreenReader.framework/Versions/A/Resources/Sounds/"
COUNTDOWN_PID_FILE="/tmp/sketchybar_pomodoro_pid"
DEFAULT_DURATION=1500  # 25 minutes

__start() {
    local name="$1"
    local duration="$2"

    (
        local time_left="$duration"

        while [ "$time_left" -gt 0 ]; do
            local minutes=$((time_left / 60))
            local seconds=$((time_left % 60))
            sketchybar --set "$name" label="$(printf "%02d:%02d" "$minutes" "$seconds")"
            sleep 1
            time_left=$((time_left - 1))
        done
        
        afplay "$SOUNDS_PATH/TrackingOn.aiff"
        sketchybar --set "$name" label="Done"
    ) &
    printf "%s\n" "$!" > "$COUNTDOWN_PID_FILE"
}

__stop() {
    if [ -f "$COUNTDOWN_PID_FILE" ]; then
        if IFS= read -r PID < "$COUNTDOWN_PID_FILE"; then
            if ps -p "$PID" > /dev/null 2>&1; then
                kill -- "$PID"
            fi
        fi
        rm -f "$COUNTDOWN_PID_FILE"
    fi
}

start_countdown() {
    afplay "$SOUNDS_PATH/TrackingOn.aiff"
    __stop
    __start "$1" "$2"
}

stop_countdown() {
    afplay "$SOUNDS_PATH/TrackingOn.aiff"
    __stop
    sketchybar --set "$SKETCHYBAR_ITEM_NAME" label="No Timer"
}

if [[ "$#" -eq 1 ]]; then
  # Start countdown with a specific duration
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    start_countdown "$(echo $SKETCHYBAR_ITEM_NAME | awk -F'.' '{print $1}')" "$1"
    exit 0
  fi

  # Stop countdown
  if [[ "$1" =~ ^stop+$ ]]; then
    stop_countdown
    exit 0
  fi
fi
