#!/usr/bin/env bash

# Todo wrapper script that can work with both local and remote todo.txt
# Usage: ./todo-wrapper.sh [action] [args...]

REMOTE_HOST="tailscalehomehub"
REMOTE_TODO_DIR="/home/mattgrieser/Documents/todo"
LOCAL_TODO_DIR="/Users/mattgrieser/todo.txt-cli"

# Function to run todo.sh on remote host
run_remote() {
    ssh -qt "$REMOTE_HOST" "cd $REMOTE_TODO_DIR && todo.sh $*"
}

# Function to run todo.sh locally
run_local() {
    cd "$LOCAL_TODO_DIR"
    # Use a temporary config that points to the remote location
    export TODO_DIR="$REMOTE_TODO_DIR"
    export TODO_FILE="$REMOTE_TODO_DIR/todo.txt"
    export DONE_FILE="$REMOTE_TODO_DIR/done.txt"
    export REPORT_FILE="$REMOTE_TODO_DIR/report.txt"
    ./todo.sh "$@"
}

# Check if we're in the local todo.txt-cli directory
if [[ "$PWD" == "$LOCAL_TODO_DIR"* ]]; then
    # We're in the local todo directory, run locally but with remote config
    run_local "$@"
else
    # We're somewhere else, run remotely
    run_remote "$@"
fi
