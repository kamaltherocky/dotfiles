#!/bin/bash

#Run the pre-hook before the setup
~/.dotfiles/scripts/pre-hook.sh

#00. Run the Brew scripts
~/.dotfiles/homebrew/setup.sh

## Run the post-hook after the setup
~/.dotfiles/scripts/post-hook.sh