#!/bin/bash

### In this script we iterate over every word.
### If it ends with a period, a comma, a colon, a 
### semicolon or an ellipsis it is remmoved.
### Then we only keep the numbers. If we find integers
### we sort them and filter out repeated ones.
### Decimal numbers (with '.' or ',') are also recognized
### and ignored. For instance, if we find 3.5 or 3,6
### we consider them to be decimal numbers.

TEXT=$(cat $1)

for WORD in $TEXT
do
    if [[ $WORD =~ [,\.\;\:]$ ]]; then
        WORD=${WORD::-1}
    fi 

    [[ $WORD =~ ^[-]?[0-9]+[.]?$ ]] && echo $WORD | tr -d '.'
done | sort -h | uniq
