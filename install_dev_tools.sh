#!/bin/bash

FZF_PATH=~/.fzf
VIM_PATH=~/.vim
TMUX_PATH=~/.tmux.conf
TOOLS_PATH=tools/kconfig-frontends

# Get the required vim tools

sudo apt update && sudo apt install -y vim cscope ctags tmux make gcc bison gperf flex repo libncurses5-dev qconf curl dh-autoreconf nmap net-tools silversearcher-ag

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

# Install ag silver search in vim

cd ~/.vim/bundle && git clone https://github.com/rking/ag.vim ag && echo "set runtimepath^=~/.vim/bundle/ag" >> ~/.vimrc
cd -

# Set 256 color mode in tmux

echo "Enable screen-256 color in tmux"
echo 'set -g default-terminal "screen-256color"' > $TMUX_PATH

# Install kconfig

if [ ! -d $TOOLS_PATH ]; then
	git clone https://bitbucket.org/nuttx/tools.git
	cd tools/kconfig-frontends
	./configure --enable-mconf --prefix=/usr
	make
	sudo make install
fi

# Print out done message

echo "Dev tools setup done ^-^ ! Source the ~/.bashrc script now"
