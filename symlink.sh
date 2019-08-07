#!/bin/bash
# pull the list of files in home and symlink them to ~
# not very sophisticated
# must be run from within dotfiles directory!

dir="$(pwd)"

for filename in ./home/.[a-zA-z]*; do
	[ -e "$filename" ] || continue
	f="$(basename "$filename")"
	echo "Symlinking \"$dir/home/$f\" to \"$HOME/$(basename $filename)\""
	ln -fs "$dir/home/$f" "$HOME/$f"
done
