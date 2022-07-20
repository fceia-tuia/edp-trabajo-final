#!/bin/bash

FILE=$1
WORDCHANGED=""

while read -ra LINE; 
do
    SENTENCE=""
    for WORD in "${LINE[@]}";
    do
        WORDCHANGED="" 
        for (( i=0; i<${#WORD}; i++ )) ; do
            if [[ ${WORD:$i:1} =~ ^[A-ZÄËÏÖÜÁÉÍÓÚÂÊÎÔÛÀÈÌÒÙÑ]+$ ]]
            then
                WORDCHANGED+=$(echo ${WORD:$i:1} | tr '[:upper:]' '[:lower:]')
            elif  [[ ${WORD:$i:1} =~ ^[a-zäëïöüáéíóúáéíóúâêîôûàèìòùñ]+$ ]]
            then
                WORDCHANGED+=$(echo ${WORD:$i:1} | tr '[:lower:]' '[:upper:]')
            else
                WORDCHANGED+=${WORD:$i:1}                
            fi
        done

        SENTENCE+="$WORDCHANGED "
    done;
    echo $SENTENCE >> output.txt
done < $FILE 

