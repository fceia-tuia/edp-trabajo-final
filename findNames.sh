#!/bin/bash

### In this script, first of all we define an empty array to save words later.
### Next, we use a text from an enter file and read its lines. 
### If the word ends in a period, a comma, a colon, a semicolon or an ellipsis, it is removed.
### Then, we normalize every present word in each line and we use a regex to evaluate if it is an own name.
### If it is and the current own name is not in the name's array, we added to it.
### Finally, we sort the array of names and print each element that it has.


FILE=$1

NAMES=()

while read -ra LINE
do
    for WORD in "${LINE[@]}"
    do
        if [[ $WORD =~ [.]{3}$ ]]
        then
            WORD=${WORD::-3}
        elif [[ $WORD =~ [,\.\;\:]$ ]]
        then
            WORD=${WORD::-1}
        fi 

 
        if [[ $WORD =~ ^[A-ZÄËÏÖÜÁÉÍÓÚÂÊÎÔÛÀÈÌÒÙÑ][a-zäëïöüáéíóúáéíóúâêîôûàèìòùñ]+$ ]]; then
            if [[ "${NAMES[*]}" =~ "$WORD" ]]; then
             continue
            fi
                
            NAMES+=( $WORD )
        fi
    done
done < $FILE

PREV_IFS=$IFS
IFS=$'\n'
NAMES_SORTED=($(sort <<<"${NAMES[*]}"))

for WORD in ${NAMES_SORTED[@]}
do
    echo $WORD
done

IFS=$PREV_IFS