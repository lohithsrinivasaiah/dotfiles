#!/bin/bash

attach_or_create_session() {
    tmux has-session -t "$1" 2>/dev/null
    if [ $? -eq 0 ]; then
        tmux attach-session -t "$1"
    else
        create_session "$1" "${2:-4}"  # Default to 4 windows if the second argument is not provided
    fi
}

create_session() {
    local session_name="$1"
    local num_windows="$2"

    tmux new-session -d -s "$session_name" -n runner
    tmux new-window -d -n vim
    for ((i=1; i<num_windows; i++)); do
        tmux new-window -d
    done
    tmux attach-session -t "$session_name"
}

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <session_name> [num_windows]"
    exit 1
fi

session_name="$1"
num_windows="${2:-4}"  # Default to 4 windows if the second argument is not provided
attach_or_create_session "$session_name" "$num_windows"

