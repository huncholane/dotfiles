#!/bin/bash

backup_dir=~/.dotfiles/backup

for folder in ./*/; do
	if [[ $folder =~ regex ]]; then continue; fi
	echo "$folder"
done
