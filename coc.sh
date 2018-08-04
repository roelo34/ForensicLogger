#!/bin/zsh
currentDate=$(date +%Y-%m-%d_%H:%M:%S)
#source the config file
source /home/$USER/.logger.cfg

vared -p 'What is the source of this file? ' -c whereFrom
vared -p 'What is the destination of this file? ' -c whereTo
hash=$(sha1sum "$1" | cut -d ' ' -f 1)
logLine=$name","$location","$currentDate","$1","$whereFrom","$whereTo","$hash

echo $logLine >> /home/$USER/Documents/ForensicLogger/CoC.csv