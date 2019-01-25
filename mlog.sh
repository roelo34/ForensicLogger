#!/bin/zsh
currentDate=$(date +%Y-%m-%d_%H:%M:%S)
#source the config file
source /home/$USER/.logger.cfg

if [ ! -f $workingDir/log.csv ]; then
            print "Log not found! Creating it for you..."
            touch $workingDir/log.csv
        fi

#questions for the log
vared -p 'What action did you take? ' -c actWhat
vared -p 'How did you do it? ' -c actHow
vared -p 'Why did you take this action? ' -c actWhy
vared -p 'What is the result of this action? ' -c actResult

#the line that is going to appear in the log file
logLine=$name","$location","$currentDate","$actWhat","$actHow","$actWhy","$actResult
echo $logLine >> $workingDir/log.csv
#test
