#!/bin/bash

# Define the source directory as the current working directory (CWD)
SOURCE_DIR=$(pwd)
TARGET_DIR=~/.config/nvim
CONFIG_DIR=~/.config/nvim/lua/config
PLUGINS_DIR=~/.config/nvim/lua/plugins

# Create necessary directories if they don't exist
mkdir -p $CONFIG_DIR
mkdir -p $PLUGINS_DIR

# Backup function to add '.bk' suffix to existing files
backup_file() {
  if [ -f "$1" ]; then
    echo "Backing up $1 to $1.bk"
    cp "$1" "$1.bk"
  fi
}

# Backup existing files before copying new ones
backup_file "$PLUGINS_DIR/user_plugins.lua"
backup_file "$PLUGINS_DIR/disable.lua"
backup_file "$CONFIG_DIR/options.lua"
backup_file "$CONFIG_DIR/autocmds.lua"
backup_file "$TARGET_DIR/lazyvim.json"

# Copy the new files to the target directory
echo "Copying files..."
cp "$SOURCE_DIR/user_plugins.lua" "$PLUGINS_DIR/"
cp "$SOURCE_DIR/disable.lua" "$PLUGINS_DIR/"
cp "$SOURCE_DIR/options.lua" "$CONFIG_DIR/"
cp "$SOURCE_DIR/autocmds.lua" "$CONFIG_DIR/"
cp "$SOURCE_DIR/lazyvim.json" "$TARGET_DIR/"

echo "Backup and copy completed successfully!"
