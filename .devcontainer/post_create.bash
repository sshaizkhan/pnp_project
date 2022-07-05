#!/bin/bash

#update and upgrade any installed packages
sudo apt update
sudo apt -y upgrade

# Install terminator
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install -y terminator

#install bash completion
sudo apt install -y bash-completion


#install nano
sudo apt-get -y install nano

colcon --log-base "./colcon-log" mixin add default "file:///home/bot/pick_and_place_ws/src/pnp_project/.devcontainer/colcon_mixins/index.yaml"

sudo chown -R bot:bot /home/bot

ln -s /home/bot/pick_and_place_ws/src/pnp_project/.devcontainer/.vscode/ /home/bot/.vscode

# link the container settings
mkdir -p /home/bot/.vscode-server/data/Machine
ln -s /home/bot/pick_and_place_ws/src/pnp_project/.devcontainer/settings.json /home/bot/.vscode-server/data/Machine/settings.json

# install Terminator config
mkdir -p /home/bot/.config/terminator
ln -s /home/bot/pick_and_place_ws/src/pnp_project/.devcontainer/terminator.config /home/bot/.config/terminator/config

# link .bashrc
rm /home/bot/.bashrc
ln -s /home/bot/pick_and_place_ws/src/pnp_project/.devcontainer/.bashrc /home/bot/.bashrc

# link .bash_aliases
# rm /home/bot/.bash_aliases
ln -s /home/bot/pick_and_place_ws/src/pnp_project/.devcontainer/.bash_aliases /home/bot/.bash_aliases

#moveit dependencies
sudo apt update && rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y

