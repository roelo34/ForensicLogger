#!/bin/zsh
currentDate=$(date +%Y-%m-%d_%H:%M:%S)
#source the config file
source /home/$USER/.logger.cfg

if [ ! -f $workingDir/CoC.csv ]; then
            print "Chain of custody not found! Creating it for you..."
            touch $workingDir/CoC.csv
        fi

vared -p 'What is the source of this file? ' -c whereFrom
vared -p 'What is the destination of this file? ' -c whereTo
vared -p 'What is the evidence number for this file? ' -c eid
hash=$(sha1sum "$1" | cut -d ' ' -f 1)
logLine=$name","$location","$currentDate","$1","$eid","$whereFrom","$whereTo","$hash

echo $logLine >> $workingDir/CoC.csv