#/bin/bash
echo "ZSH MUST BE INSTALLED FOR THIS INSTALLER TO COMPLETE SUCCESSFULLY!!!"
echo "The Forensic Logger is turned off by default. To enable it set logStat=1 in /home/$USER/.logger.cfg"

mkdir /home/$USER/Documents/ForensicLogger
cp .logger.cfg /home/$USER/.logger.cfg

path=$(pwd)/parser.sh
echo "source" $path >> /home/$USER/.zshrc
