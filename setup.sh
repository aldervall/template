#!/bin/bash

# Exit on error
set -e

echo "Setting up development environment..."

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install uv if not already installed
if ! command_exists uv; then
    echo "Installing uv (python-uv)..."
    
    # Check the package manager and install accordingly
    if command_exists apt; then
        sudo apt update && sudo apt install -y python3-pip
        pip install uv
    elif command_exists brew; then
        brew install python-uv
    elif command_exists dnf; then
        sudo dnf install -y python3-pip
        pip install uv
    else
        curl -sSf https://astral.sh/uv/install.sh | bash
    fi
    
    echo "uv installed successfully!"
else
    echo "uv is already installed."
fi

# Install direnv if not already installed
if ! command_exists direnv; then
    echo "Installing direnv..."
    
    # Check the package manager and install accordingly
    if command_exists apt; then
        sudo apt update && sudo apt install -y direnv
    elif command_exists brew; then
        brew install direnv
    elif command_exists dnf; then
        sudo dnf install -y direnv
    else
        echo "Please install direnv manually: https://direnv.net/docs/installation.html"
        exit 1
    fi
    
    # Add direnv hook to shell configuration if not already present
    SHELL_CONFIG=""
    if [[ -f "$HOME/.bashrc" ]]; then
        SHELL_CONFIG="$HOME/.bashrc"
    elif [[ -f "$HOME/.zshrc" ]]; then
        SHELL_CONFIG="$HOME/.zshrc"
    fi
    
    if [[ -n "$SHELL_CONFIG" ]]; then
        if ! grep -q "direnv hook" "$SHELL_CONFIG"; then
            echo 'eval "$(direnv hook bash)"' >> "$SHELL_CONFIG"
            echo "Added direnv hook to $SHELL_CONFIG"
            echo "Please restart your shell or run: source $SHELL_CONFIG"
        fi
    else
        echo "Please add the direnv hook to your shell configuration manually."
        echo 'For bash: eval "$(direnv hook bash)"'
        echo 'For zsh: eval "$(direnv hook zsh)"'
    fi
    
    echo "direnv installed successfully!"
else
    echo "direnv is already installed."
fi

# Create virtual environment if it doesn't exist
if [ ! -d ".venv" ]; then
    echo "Creating Python virtual environment..."
    uv venv
    echo "Virtual environment created successfully!"
else
    echo "Virtual environment already exists."
fi

# Create or update .envrc file
echo "Creating .envrc file..."
cat > .envrc << EOF
# This file is automatically loaded by direnv when entering this directory
# It activates the Python virtual environment

source_up  # Load any parent .envrc files
source .venv/bin/activate

# Add any other environment variables below
# export MY_VAR=value
EOF

# Allow direnv to load the .envrc file
direnv allow .

echo "Setup complete! The Python virtual environment will be activated automatically when you enter this directory."
