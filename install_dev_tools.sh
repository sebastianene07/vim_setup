#!/bin/bash

FZF_PATH=~/.fzf
VIM_PATH=~/.vim
TMUX_PATH=~/.tmux.conf

# Get the required vim tools

sudo apt update && sudo apt install vim cscope ctags tmux make gcc

# Install fuzzy finder if it doesn't exist

if [ ! -d $FZF_PATH ]; then
	echo "FZF not found, downloading from github"
	git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_PATH
	$FZF_PATH/install
fi

# Create directories and copy the .vim configurations

mkdir -p $VIM_PATH
cp .vimrc ~/.
for dir_name in autoload bundle colors plugin; do
	echo "Copying $dir_name to $VIM_PATH"
	cp -r $dir_name $VIM_PATH/.
done

# Set 256 color mode in tmux

echo "Enable screen-256 color in tmux"
echo 'set -g default-terminal "screen-256color"' > $TMUX_PATH

# Print out done message

echo "Dev tools setup done ^-^ !"
