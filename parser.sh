preexec() {
    currentDate=$(date +%Y-%m-%d_%H:%M:%S)
    #source the config file
    source /home/$USER/.logger.cfg

    if [ $logStat -eq 1 ]; then
        #Ask if the next command should be logged or not
        vared -p 'Do you want to log this command? [y/N]: ' -c tmp
        #Ask for further information about the command
        logCommand(){
            vared -p 'What do you want to accomplish by running this command? ' -c what
            vared -p 'Why do you want to run this command? ' -c why
            
        }

        #cases
        case "$tmp" in
        "y") logCommand; print "logged";\
            logLine=($name","$location","$currentDate","$what","$1","$why",");\
            echo -ne $logLine >> $workingDir/log.csv;;
        "n") print "";;
        *) print "";
        esac

    fi

}

precmd(){
    source /home/$USER/.logger.cfg

    #if logStat is equal to 0, do nothing
    if [ $logStat -eq 1 ]; then
        if [ ! -f $workingDir/log.csv ]; then
            print "Log not found! Creating it for you..."
            touch $workingDir/log.csv
        fi
        vared -p 'Copy the output and paste here (Enter to skip): ' -c outCom
        
        #Stop when outCom equals a newline
        if [[ "$outCom" == "\n" ]]; then
            kill -INT $$
        fi

        #Replace newlines in outCom with spaces
        cleanCom=$(echo "$outCom" | tr '\n' ' ')
        echo $cleanCom >> $workingDir/log.csv
    fi

}