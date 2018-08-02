preexec() {
    file="/home/$USER/.logger.cfg"
    while IFS= read -r line; do
    #Check of logger.cfg een 1 bevat
        if [ $line -eq 1 ] ; then
            stop=1
        else
            stop=0
        fi
    done < "$file"
    #werkt niet
    if ! [ $stop -eq 1 ]; then
        #vragen of de command gelogd moet worden of niet
        vared -p 'Do you want to log this command? [y/N]: ' -c tmp

        #cases
        case "$tmp" in
        "y") print "logged"; echo $1 >> /home/$USER/Documents/log.txt;;
        "n") print "";;
        *) print "";
        esac
    fi

}