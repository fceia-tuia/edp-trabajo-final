#!/bin/bash

FILE=$1

ONE_VOWEL=()

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do
        if [[ " ${ONE_VOWEL[*]} " =~ " $WORD " ]]; then
            continue
        fi

        if [ ${#WORD} -gt 3 ]
        then 
            if [[ $WORD =~ [,]$ ]]
            then
                WORD=${WORD::-1}
            fi 

            ONE_VOWEL+=( $( echo $WORD | grep -vi '[eiouéíóú0-9]' ) )
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aiouáíóú0-9]' ) )
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aeouáéóú0-9]' ) ) 
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aeiuáéíú0-9]' ) )
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aeioáéíó0-9]' ) )  
        fi
    done;
done < $FILE

IFS=$'\n' ONE_VOWEL_SORTED=($(sort <<<"${ONE_VOWEL[*]}"))

for WORD in ${ONE_VOWEL_SORTED[@]}
do
    echo $WORD
done