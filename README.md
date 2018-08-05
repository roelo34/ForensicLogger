# ForensicLogger
A way to log all command-line commands to a file and generate a chain of custody.

## DISCLAIMER
My scripting skills are very mediocre! If you have any ideas or feedback, don't be hesitant to fork this repository or send me a message!

## Installation
For these scripts, you will need ZSH. ZSH can be downloaded like so:
### Debian based
`sudo apt-get install zsh`
### Arch based
`sudo pacman -S zsh`
### Fedora based
`sudo yum install zsh`

After installing ZSH you have to give the scripts execution permission

`chmod +x parser.sh coc.sh install.sh`

Finally you can run *install.sh* and you're ready to start using ForensicLogger!

### Optional
You can add *coc.sh* to your PATH to make adding entries to your chain of custody even easier!

`sudo cp coc.sh /usr/bin/coc`
