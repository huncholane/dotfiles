#!/bin/bash

sources=(
	hypr
	kitty
	nvim
	pipewire
	tmux-powerline
	tmux
	waybar
	wezterm
)

for src in "${sources[@]}"; do
	cmd="rsync -a --delete $HOME/.config/$src/ $HOME/.dotfiles/$src/"
	echo "$cmd"
	$cmd
done

sources=(
	.oh-my-zsh/
	.zshrc
)

for src in "${sources[@]}"; do
	cmd="rsync -a --delete $HOME/$src $HOME/.dotfiles/$src"
	echo "$cmd"
	$cmd
done
