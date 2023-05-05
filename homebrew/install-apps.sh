#! /bin/bash

###### Functions ######

## Note: The below function is archived as we will start using the Brew Bundle feature along with a BrewFile
install_brew_applications()
{
    apps_list=$1
    is_cask=$2

    # Store the Original File Separator so we can restore at the end of the function
    OFS=$IFS
    IFS=,

    for app in $apps_list;
    do
        if [ "$is_cask" = "y" ]
        then
            brew list $app >/dev/null 2>&1 && [ $? ] &&  printf "%-50s : [Installed]\n" $app || (printf "%-50s : [Installing...]\n" $app && brew install --cask $app)
        else
            brew list $app >/dev/null 2>&1 && [ $? ] &&  printf "%-50s : [Installed]\n" $app || (printf "%-50s : [Installing...]\n" $app && brew install $app)
        fi
    done

    IFS=$OFS
}



##### Main - Start #####

# Install XCode tools
# xcode-select --install

# Install homebrew - Package Manager
echo -e "\n00. Installing brew - package manager"
echo "--------------------------------------"
app="brew"
command -v $app >/dev/null 2>&1 [ $? ] &&  printf "%-50s : [Installed]\n" $app || { printf "%-50s : [Installing...]\n" $app; /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"; }

# Install the list of command line applications
echo -e "\n01. Installing command line apps and mac OS applications using brew / cask"
echo "--------------------------------------------"
brew bundle --file=~/.dotfiles/homebrew/Brewfile


# List of comma separated applications (without any spaces)
# terminal_apps="zsh,git,tree,jq,httpie,fzf,gh"
# install_brew_applications $terminal_apps "n"


# Install the list of Mac OS X applications as Cask
echo -e "\n02. Installing Mac OS X apps using brew cask"
echo "---------------------------------------------"
# List of comma separated applications (without any spaces)
cask_apps="iterm2,visual-studio-code"
install_brew_applications $cask_apps "y"

echo -e "\n"


# Manually Configure the Quake visor style window profile in iTerm2
# Edit the profile - Add a hotkey to open the window with only the Animate option selected, Set the style to Top of the Screen, set the Columns to the max width and rows to 30
# Set iTerm as default in login items - System Preferences > User and groups > Login Items

