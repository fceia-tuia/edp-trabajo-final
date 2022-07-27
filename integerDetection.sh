#!/bin/bash

### In this script we iterate over every word
### but we only keep the numbers. If we find integers
### we sort them and filter out repeated ones.
### Decimal numbers (with '.' or ',') are also recognized
### and ignored. For instance, if we find 3.5 or 3,6
### we consider them to be decimal numbers.

TEXT=$(cat $1)

for WORD in $TEXT
do
    [[ $WORD =~ ^[-]?[0-9]+[.]?$ ]] && echo $WORD | tr '.' ' ' | xargs
done | sort -h | uniq
