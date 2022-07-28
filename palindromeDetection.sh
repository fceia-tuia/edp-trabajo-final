#!/bin/bash

### In this script, we use an iterative structure to evaluate every word in an entry text.
### First, we normalize each word. This consists of ignoring all types of accents and save the new value in a variable. 
### Then, we convert that previously normalized word to lower case.
### Next, we save the reverted value of the lower case word into a variable.
### Finally, we compare both words, the lower case word and the reversed one, and if they are equals we print the original given word for the current iteration.


TEXT=$1

while read -ra LINE
do
    for WORD in "${LINE[@]}"
    do
        if [[ $WORD =~ [,.]$ ]]; then
            WORD=${WORD::-1}
        fi 
        
        WORD_NORMALIZED=$(echo $WORD | iconv -t ASCII//TRANSLIT)

        WORD_LOWER=$(echo "$WORD_NORMALIZED" | tr '[:upper:]' '[:lower:]')
        
        REV_STR=$(echo $WORD_LOWER | rev)
    
        if [[ $WORD_LOWER == $REV_STR ]] && [[ ${#WORD_LOWER} > 3 ]] && [[ ! $WORD_LOWER =~ ^[0-9]+$ ]]; then
            echo $WORD 
        fi
    done

done < $TEXT
