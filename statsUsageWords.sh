#!/bin/bash

### In this script we parse the text entirely to lowercase
### to make it easier to identify the usage of the same words.
### Then we declare an associative array (or dictionary) and add
### each used word as a key with the count of how many times it
### appears as the value. Finally we sort the dictionary by
### value and display the first 10 keys. If the "word" contains
### numbers, then we no longer consider it as word.

TEXT=$(cat "$1" | tr '[:upper:]' '[:lower:]')

declare -A WORDS

for WORD in $TEXT
do
    [ $WORD =~ [0-9] ] && continue
    CHARACTER_COUNT=$(echo -n $WORD | tr -d '.' | wc -m)

    [ $CHARACTER_COUNT -ge 4 ] && WORDS[$WORD]=$((${WORDS[$WORD]} + 1))
done

for WORD in ${!WORDS[@]}
do
    echo "$WORD ${WORDS[$WORD]}"
done | sort -rn -k2 | head -n 10 | cut -d " " -f1

exit 0
