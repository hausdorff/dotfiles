#! /bin/bash

mkdir -p "$HOME/.vim/backups"
mkdir -p "$HOME/.vim/swaps"

__link_subtrees "$HOME/.vim" "$HOME/.vim.d"
