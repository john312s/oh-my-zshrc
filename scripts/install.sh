#!/bin/bash

# Check for the $ZSH folder.
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is installed, so we're going to try to clone the fastfetch repo."
    # Check to see if the fastfetch folder exists.
    if [ -d "$HOME/.local/share/fastfetch" ]; then
        echo "Looks like all the dependencies are already installed!"
        exit 0
    else
        cd ~/.local/share
        git clone https://github.com/LierB/fastfetch.git
    fi
else
    echo "Oh My Zsh isn't installed."
    # Let the user choose whether or not to install Oh my zsh!.
    read -p "Should we install it? y/n: " choice
    if [ "$choice" = "y" ] || [ "$choice" = "Y" ] || [ "$choice" = "yes" ] || [ "$choice" = "Yes" ] ; then
        echo "Installing Oh My Zsh, you'll have to run the script again after."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # If they respond with anything other than the afforementioned.
    else
        echo "Alright, aborting..."
        exit 1
    fi
fi
