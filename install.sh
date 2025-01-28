#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create symbolic links
echo "Creating symbolic links..."

# Function to create backup and symlink
create_symlink() {
    local src="$1"
    local dest="$2"

    # If the destination already exists
    if [ -e "$dest" ]; then
        # If it's already a symlink pointing to our dotfiles, skip
        if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
            echo "Symlink already exists: $dest -> $src"
            return
        fi

        # Backup existing file/directory
        echo "Backing up existing $dest to ${dest}.backup"
        mv "$dest" "${dest}.backup"
    fi

    # Create the symlink
    echo "Creating symlink: $dest -> $src"
    ln -s "$src" "$dest"
}

# Create .config symlink
create_symlink "$DOTFILES_DIR/.config" "$HOME/.config"

# Create .vscode symlink
# create_symlink "$DOTFILES_DIR/.vscode" "$HOME/.vscode"

echo "Done! Dotfiles have been installed."
