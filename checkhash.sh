#!/bin/zsh
fileHashType=$(echo $2 | cut -d. -f2)
hashingFile=$("$fileHashType"sum "$1" | cut -d ' ' -f 1)

if $hashingFile; then
    echo 'An error occured, the file containing the hash is probably the wrong format...'
    echo 'Make sure the extention of the file containing the hash IS the hashing algorithm! i.e. ".sha1"'
else
    givenHash=$(cat "$2" | cut -d ' ' -f 1)

    echo 'Please ignore the error above.'
    echo 'Checksum result: ' $hashingFile
    echo 'Given hash: ' $givenHash

    if [ $hashingFile = $givenHash ]; then
        echo "Hashes match!"
    else
        echo "Hashes DO NOT match!"
    fi
fi