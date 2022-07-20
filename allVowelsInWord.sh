#!/bin/bash

TEXT=$1

declare -A WORDS_WITH_ALL_VOWELS

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do    
        if [[ $WORD =~ [,.]$ ]]
        then
            WORD=${WORD::-1}
        fi 
        # WORD=${WORD/[áÁ]/a}
        # WORD=${WORD/[éÉ]/e}
        # WORD=${WORD/[íÍ]/i}
        # WORD=${WORD/[óÓ]/o}
        # WORD=${WORD/[úÚ]/u}

       if [[ $(echo $WORD | grep -i [aá] | grep -i [eé] | grep -i [ií] | grep -i [oó] | grep -i [uú]) ]]
        then        
                if [[ $( echo WORDS_WITH_ALL_VOWELS[$WORD]) ]]
                then
                    WORDS_WITH_ALL_VOWELS[$WORD]=$( expr ${WORDS_WITH_ALL_VOWELS[$WORD]} + 1 )
                else
                    WORDS_WITH_ALL_VOWELS[$WORD]=1
                fi
        fi
    done;
done < $TEXT

IFS=$'\n' WORDS_WITH_ALL_VOWELS_SORTED=($(sort <<<"${!WORDS_WITH_ALL_VOWELS[*]}"))

for KEY in "${WORDS_WITH_ALL_VOWELS_SORTED[@]}"; do
    echo "$KEY (${WORDS_WITH_ALL_VOWELS[$KEY]})"
done
