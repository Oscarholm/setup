#!/bin/bash
# Simple setup.sh for configuring Ubuntu LTS EC2 instance
# for headless setup. 

# Install programs
sudo apt update
sudo apt install \
    curl git vim python3-pip \
    rsync tmux

# Install nvm: node-version manager
# https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
nvm use node

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
curl https://cli-assets.heroku.com/install.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

git clone https://github.com/oscarholm/dotfiles.git
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.gitconfig .
