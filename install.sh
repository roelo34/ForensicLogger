touch /home/$USER/.logger.cfg
print "ZSH MUST BE INSTALLED FOR THIS INSTALLER TO COMPLETE SUCCESSFULLY!!!"
read -p 'Is zsh installed on your system? [y/n] ' install
case "$install" in
        "y") print "Continuing...";;
        "n") kill -INT $$;
    esac
read -p 'Do you want to enable the logger after the installer finishes? [y/N]' tmp
case "$tmp" in
        "y") echo '1' > /home/$USER/.logger.cfg;;
        "n") echo '0' > /home/$USER/.logger.cfg;;
        *) echo '0' > /home/$USER/.logger.cfg;
    esac

touch /home/$USER/Documents/log.csv
path=$(pwd)/parser.sh
echo "source" $path >> /home/$USER/.zshrc

