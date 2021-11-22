#!/bin/bash
# Simple setup.sh for configuring Ubuntu LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12


# vim setup



# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
curl https://cli-assets.heroku.com/install.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

fi
git clone https://github.com/oscarholm/dotfiles.git
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.gitconfig .
