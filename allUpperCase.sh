#!/bin/bash

TEXT=$(cat $1)

for WORD in $TEXT
do
   [[ $WORD =~ [0-9] ]] && continue
    SANITIZED_WORD=$(echo $WORD | tr -d '.')
    [[ $SANITIZED_WORD =~ [[:upper:]]+$ ]] && echo $SANITIZED_WORD
done | sort | uniq
