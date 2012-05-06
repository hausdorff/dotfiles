#! /bin/bash

if [ -r "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
else
	echo ".bashrc not found; environment will not be set up."
fi
