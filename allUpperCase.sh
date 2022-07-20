#!/usr/bin/env bash

TEXT=$(cat $1)

for WORD in $TEXT
do
    if [[ $WORD =~ [[:upper:]]+$ ]]; then
        echo $WORD
    fi
done | sort | uniq
