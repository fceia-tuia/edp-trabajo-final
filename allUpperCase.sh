#!/bin/bash

### In this script we find words that are written
### entirely in uppercase and show them. If the "word" contains
### numbers, then we no longer consider it as word.

TEXT=$(cat $1)

for WORD in $TEXT
do
    [[ $WORD =~ [0-9] ]] && continue
    SANITIZED_WORD=$(echo $WORD | tr -d '.')

    [[ $SANITIZED_WORD =~ [[:upper:]]+$ ]] && echo $SANITIZED_WORD
done | sort | uniq
