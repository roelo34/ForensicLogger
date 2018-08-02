preexec() {
    #vragen of de command gelogd moet worden of niet
    vared -p 'Do you want to log the next command? [y/N]: ' -c tmp

    case "$tmp" in
    "y") print "logged";;
    "n") print "";;
    *) print "";
    esac

    #print $1

    


}