#!/bin/bash

activate_virtualenv() {
    local session_name="$1"
    local num_windows=$(tmux list-windows -t "$session_name" | wc -l)
    local env_dir=$(find "$PWD" -type d -name "env" -print -quit)

    if [ -n "$env_dir" ]; then
        for ((i=0; i<num_windows; i++)); do
            tmux send-keys -t "$session_name:$i" "source $env_dir/bin/activate && clear" Enter
        done
    fi
}


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
    activate_virtualenv "$session_name"
    tmux attach-session -t "$session_name"
}

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <session_name> [num_windows]"
    exit 1
fi

session_name="$1"
num_windows="${2:-4}"  # Default to 4 windows if the second argument is not provided
attach_or_create_session "$session_name" "$num_windows"

