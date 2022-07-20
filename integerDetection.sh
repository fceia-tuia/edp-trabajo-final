#!/bin/bash

TEXT=$(cat $1)

for WORD in $TEXT
do
    if [[ $WORD =~ ^[-]?[0-9]+[.]?$ ]]; then
        echo $WORD | tr '.' ' ' | xargs
    fi
done | sort -h | uniq
