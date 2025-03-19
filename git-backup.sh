#!/bin/bash

# Exit on error
set -e

# Default commit message
DEFAULT_MESSAGE="Backup commit $(date '+%Y-%m-%d %H:%M:%S')"

# Display usage information
usage() {
    echo "Usage: $0 [commit message]"
    echo
    echo "This script adds all changes, commits them, and pushes to the remote repository."
    echo "If no commit message is provided, a default timestamp message will be used."
    echo
    echo "Examples:"
    echo "  $0                              # Uses default message with timestamp"
    echo "  $0 \"Added new feature\"          # Uses the provided message"
    exit 1
}

# Check if help is requested
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    usage
fi

# Get commit message (use default if not provided)
COMMIT_MESSAGE="${1:-$DEFAULT_MESSAGE}"

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not in a git repository."
    exit 1
fi

# Check if remote repository is configured
REMOTE_EXISTS=$(git remote -v | wc -l)
if [ "$REMOTE_EXISTS" -eq 0 ]; then
    echo "Warning: No remote repository configured."
    echo "The changes will be committed locally but not pushed."
    echo "To add a remote repository, use:"
    echo "  git remote add origin <repository-url>"
    echo
    echo "Continuing with local commit only..."
    HAS_REMOTE=false
else
    HAS_REMOTE=true
fi

# Get current branch
CURRENT_BRANCH=$(git branch --show-current)
if [ -z "$CURRENT_BRANCH" ]; then
    echo "Error: Not on any branch. You might be in a 'detached HEAD' state."
    exit 1
fi

echo "Current branch: $CURRENT_BRANCH"

# Add all changes
echo "Adding all changes to staging area..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Commit changes
echo "Committing changes with message: \"$COMMIT_MESSAGE\""
git commit -m "$COMMIT_MESSAGE"

# Push to remote if it exists
if [ "$HAS_REMOTE" = true ]; then
    echo "Pushing changes to remote repository..."
    git push origin "$CURRENT_BRANCH"
    echo "Backup complete! Changes have been pushed to the remote repository."
else
    echo "Backup complete! Changes have been committed locally."
fi
