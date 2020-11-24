#!/bin/bash 

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

if [[ "$MACHINE" == "Linux" ]]
  then 
    source linux/setup.sh
elif [[ "$MACHINE" == "Mac" ]]
  then 
    source mac/setup.sh
fi

echo "You may need to run 'bat cache -b'"
