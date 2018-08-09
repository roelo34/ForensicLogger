# ForensicLogger
The ForensicLogger is a set of scripts that helps with making logs and chain of custodies for digital forensics.

### The Logger
The logger takes in your name, location, timestamp of the command you ran and asks a couple questions you need in order to make a proper digital forensics log!

Before a command is executed, the logger will ask if you want to log the command or not. If yes, it will ask *what do you wish to accomplish with the command* and *why*. Afterwards it asks to copy and paste the output in the terminal, then it will write all the necessary data to a csv file named: *log.csv*. This file can then be imported in your application of choice.

### The Manual Logger
The manual logger *mlog.sh* works similarly to *parser.sh*, but instead of parsing the command you executed in the terminal, it will ask an extra question regarding your action.

### The Chain of Custody Generator
The chain of custody generator *coc.sh* will take in a file, of which it will take the sha1 hash and export it to a file named: *CoC.csv*. This file will, just like the log, contain your name, location and timestamp of when the script was executed.

If left unconfigured, the script will ask you three questions:
- What is the source of this file?
- What is the destination of this file?
- What is the evidence ID of this file?

Standard awnsers to these questions are configurable in *.logger.cfg*. However, the evidence ID cannot be set in the configuration file.

## DISCLAIMER
My scripting skills are very mediocre! If you have any ideas or feedback, don't hesitate to fork this repository or send me a message!

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

**Make sure to NOT run the install script as root!**

## Configuring
After installing, you can find a configuration file in your home directory named: *.logger.cfg*. In this file are configurable variables like: turning the logger on or off and setting your name and location for your digital forensic log.

More details about the variables are in the configuration file itself.