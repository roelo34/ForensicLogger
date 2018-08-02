preexec() {
    file="/home/$USER/.logger.cfg"
    currentDate=$(date +%Y-%m-%d_%H-%M-%S)

    while IFS= read -r line; do
    #Check of logger.cfg een 1 bevat
        if [ $line -eq 1 ] ; then
            stop=1
        else
            stop=0
        fi
    done < "$file"

    if ! [ $stop -eq 1 ]; then
        #vragen of de command gelogd moet worden of niet
        vared -p 'Do you want to log this command? [y/N]: ' -c tmp
        #Verdere informatie voor het loggen van een command
        logCommand(){
            vared -p 'What do you want to accomplish by running this command?' -c what
            vared -p 'Why do you want to run this command?' -c why
            
        }
        
        #cases
        #logLine is voor nu hardcoded, later meer functionaliteit in .logger.cfg
        case "$tmp" in
        "y") logCommand; print "logged";\
            logLine=("Roel"",""Wassenaar"","$currentDate","$what","$1","$why",");\
            echo $logLine >> /home/$USER/Documents/log.csv;;
        "n") print "";;
        *) print "";
        esac

    fi

}
