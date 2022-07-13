#!/bin/bash

WORD=$1
WORDCHANGED=''

for (( i=0; i<${#WORD}; i++ )) ; do
    
    if [[ ${WORD:$i:1} =~ ^[A-ZÄËÏÖÜÁÉÍÓÚÂÊÎÔÛÀÈÌÒÙÑ]+$ ]]
    then
        WORDCHANGED+=$(echo ${WORD:$i:1} | tr '[:upper:]' '[:lower:]')
        
    elif  [[ ${WORD:$i:1} =~ ^[a-zäëïöüáéíóúáéíóúâêîôûàèìòùñ]+$ ]]
    then
        WORDCHANGED+=$(echo ${WORD:$i:1} | tr '[:lower:]' '[:upper:]')
    
    else
        echo "It isn't a letter: " ${WORD:$i:1} 
    fi

done

echo $WORDCHANGED
