#!/bin/zsh
echo "ZSH MUST BE INSTALLED FOR THIS INSTALLER TO COMPLETE SUCCESSFULLY!!!"
echo "The Forensic Logger is turned off by default. To enable it set logStat=1 in /home/$USER/.logger.cfg"

echo "Creating a backup of .zshrc"
cp /home/$USER/.zshrc /home/$USER/.zshrc.$(date +%Y-%m-%d_%H:%M:%S).bak

echo "Creating Forensic Logger directory"
mkdir /home/$USER/Documents/ForensicLogger

echo "Copying the basic config"
cp .logger.cfg /home/$USER/.logger.cfg

path=$(pwd)/parser.sh
echo "source" $path >> /home/$USER/.zshrc

echo "Installing coc & mlog aliasses"
echo "alias coc='zsh $(pwd)/coc.sh'" >> /home/$USER/.zshrc
echo "alias mlog='zsh $(pwd)/mlog.sh'" >> /home/$USER/.zshrc

echo "Sourcing .zshrc again"
source /home/$USER/.zshrc