#!/bin/bash
TEXT=$1

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do
        WORD_NORMALIZED=$(echo $WORD | iconv -t ASCII//TRANSLIT)

        WORD_LOWER=$(echo "$WORD_NORMALIZED" | tr '[:upper:]' '[:lower:]')
        
        REV_STR=$(echo $WORD_LOWER | rev)
    
        if [[ $WORD_LOWER == $REV_STR ]]
        then
            echo $WORD 
        fi
    done;

done < $TEXT
