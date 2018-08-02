preexec() {
    file="/home/$USER/.logger.cfg"
    currentDate=$(date +%Y-%m-%d_%H-%M-%S)

    while IFS= read -r line; do
    #Check of logger.cfg een 1 bevat
        if [ $line -eq 1 ] ; then
            stop=0
        else
            stop=1
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

precmd(){
    file="/home/$USER/.logger.cfg"

    while IFS= read -r line; do
    #Check of logger.cfg een 1 bevat
        if [ $line -eq 1 ] ; then
            stop=0
        else
            stop=1
        fi
    done < "$file"

    #Als .logger.cfg een 1 bevat, doe niks.
    if ! [ $stop -eq 1 ]; then
        vared -p 'Copy the output and paste here: ' -c outCom
        echo $outCom >> /home/$USER/Documents/log.csv
    fi

    #Checken of het einde van het bestand een \n bevat. Zo ja, verwijder deze.
    if [[ $(tail -c1 /home/$USER/Documents/log.csv | wc -l) == 1 ]]; then
        head -c -1 /home/$USER/Documents/log.csv > /home/$USER/Documents/log.tmp
        mv /home/$USER/Documents/log.tmp /home/$USER/Documents/log.csv
    fi
}
