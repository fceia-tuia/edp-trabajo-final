#!/bin/bash

### In this script we find words that are written entirely in uppercase and show them. 
### If the word ends in a period, a comma, a colon, a semicolon or an ellipsis it is removed.
### If the "word" contains numbers, then we no longer consider it as word.

TEXT=$(cat $1)

for WORD in $TEXT
do
    if [[ $WORD =~ [.]{3}$ ]]
    then
        WORD=${WORD::-3}
    elif [[ $WORD =~ [,\.\;\:]$ ]]
    then
        WORD=${WORD::-1}
    fi 

    [[ $WORD =~ [0-9] ]] && continue
    SANITIZED_WORD=$(echo $WORD | tr -d '.')

    [[ $SANITIZED_WORD =~ [[:upper:]]+$ ]] && echo $SANITIZED_WORD
done | sort | uniq
