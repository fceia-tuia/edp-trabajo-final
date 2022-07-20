#!/bin/bash

FILE=$1

NAMES=()

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do
        if [[ $WORD =~ [,.]$ ]]
        then
            WORD=${WORD::-1}
        fi
 
        if [[ $WORD =~ ^[A-ZÄËÏÖÜÁÉÍÓÚÂÊÎÔÛÀÈÌÒÙÑ][a-zäëïöüáéíóúáéíóúâêîôûàèìòùñ]+$ ]]
        then
            if [[ " ${NAMES[*]} " =~ " $WORD " ]]; then
             continue
            fi
                
            NAMES+=( $WORD )
        fi
    done;
done < $FILE

IFS=$'\n' NAMES_SORTED=($(sort <<<"${NAMES[*]}"))

for WORD in ${NAMES_SORTED[@]}
do
    echo $WORD
done