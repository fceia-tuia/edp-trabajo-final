#!/bin/bash

### In this script, first of all we declare an empty associative array to save words and their attributes later.
### Next, we use a text from an enter file and read its lines. 
### Then, we remove the comma and dot that the word could have.
### We evaluate if this word without comma and dot contains all vowels al least once.
### If it does, we check if already exists in the associative array. 
### If that is the case, we increment by one the value of that key.
### If it's not we save the word as a key in the associative array with the value of 1. 
### After that, we define a new array and save on it the sorted array of words with all vowels.
### Finally, we print in alphabetic order every word that the sorted array has and the number of times that appears.


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
