#!/bin/bash

dotfiles=(
	"hypr:$HOME/.config/hypr"
	"kitty:$HOME/.config/kitty"
	"nvim:$HOME/.config/nvim"
	"pipewire:$HOME/.config/pipewire"
	"tmux-powerline:$HOME/.config/tmux-powerline"
	"tmux:$HOME/.config/tmux"
	"waybar:$HOME/.config/waybar"
	"wezterm:$HOME/.config/wezterm"
	"pipewire:$HOME/.config/pipewire"
	"yabai:$HOME/.config/yabai"
	"skhd:$HOME/.config/skhd"
	"btop:$HOME/.config/btop"
	"broot:$HOME/.config/broot"
	"fastfetch:$HOME/.config/fastfetch"
	"oh-my-zsh:$HOME/.oh-my-zsh"
	"zshrc:$HOME/.zshrc"
)

# Perform the input function on each path
# Input function should accept src and dst as args
iter() {
	local src
	local dst
	for pair in "${dotfiles[@]}"; do
		IFS=":" read -r src dst <<<"$pair"
		"$1" "$src" "$dst"
	done
}

backup_dir="$PWD/backup"

# Copies existing dsts into the ignored backup directory
# Accepts l and r as arguments
backup_pair() {
	local l="$1"
	local r="$2"
	local src="$r"
	local dst="$backup_dir/$l"
	local cmd="$src not found"
	if [ -L "$src" ]; then
		cmd="$src is already a link"
	elif [ -d "$src" ]; then
		cmd="mkdir -p $dst && cp -r $src $dst"
		eval "$cmd"
	elif [ -f "$src" ]; then
		cmd="cp $src $dst"
		eval "$cmd"
	fi
	echo "-> $cmd"
}

# Backs up old files into $PWD/backup/
backup() {
	echo "Backing up current config files into $backup_dir"
	if [ -d "$backup_dir" ]; then
		rm -rf "$backup_dir"
	fi
	mkdir "$backup_dir"
	iter backup_pair
}

# Deletes existing config files and creates a symbolic link
# Accepts src and target as arguments
link_pair() {
	local src="$PWD/$1"
	local target="$2"
	local cmd="rm -rf $target && ln -s $src $target"
	eval "$cmd"
	echo "-> $cmd"
}

# Removes actual config and replaces with symbolic link
link() {
	echo "Destroying existing config and replacing with symbolic link to dotfile config"
	iter link_pair
}

# Backs up current config and replaces existing config with symbolic links
install() {
	backup
	echo
	link
	echo
	echo "Checking for missing installs"
	if ! which go >/dev/null 2>&1; then echo "Please install golang"; fi
	if ! which rustup >/dev/null 2>&1; then echo "Please install rust"; fi
	if ! which nvm >/dev/null 2>&1; then echo "Please install nvm"; fi
	if ! which fzf >/dev/null 2>&1; then echo "Please install fzf"; fi
	if ! which lsd >/dev/null 2>&1; then echo "Please install lsd"; fi
	if ! which conda >/dev/null 2>&1; then echo "Please install anaconda or miniconda"; fi
	if ! which yabai >/dev/null 2>&1; then echo "If using mac, please install yubai"; fi
	if ! which skhd >/dev/null 2>&1; then echo "If using mac, please install skhd"; fi
	if ! which bat >/dev/null 2>&1; then echo "Please install bat"; fi
	if ! which lazygit >/dev/null 2>&1; then echo "Please install lazygit"; fi
	if ! which btop >/dev/null 2>&1; then echo "Please install btop"; fi
	if ! which fastfetch >/dev/null 2>&1; then echo "Please install fastfetch"; fi
}

# dispatch based on first argument
case "$1" in
backup) backup ;;
link) link ;;
install) install ;;
*) echo "Usage: $0 <backup|link|install>" ;;
esac
