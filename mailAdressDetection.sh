#!/bin/bash

FILE=$1

MAIL_ADRESS=()

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do
        if [[ " ${MAIL_ADRESS[*]} " =~ " $WORD " ]]; then
            continue
        fi
        
        if [[ $WORD =~ [,.]$ ]]
        then
            WORD=${WORD::-1}
        fi 
        
        if [[ $WORD =~ ^[a-zA-Z0-9\!\#$%\&\'*+-/\=?^_\`\{|\}~]+@[a-z]+\.com(\.[a-z]+)*$ ]]
        then            
            MAIL_ADRESS+=( $WORD )
        fi
    done;
done < $FILE

IFS=$'\n' MAIL_ADRESS_SORTED=($(sort <<<"${MAIL_ADRESS[*]}"))

for WORD in ${MAIL_ADRESS_SORTED[@]}
do
    echo $WORD
done