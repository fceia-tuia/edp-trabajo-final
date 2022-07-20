#!/bin/bash

TEXT=$(cat "$1" | tr '[:upper:]' '[:lower:]')

declare -A WORDS

for WORD in $TEXT
do
    CHARACTER_COUNT=$(echo -n $WORD | wc -m)

    if [ $CHARACTER_COUNT -ge 4 ]; then
            WORDS[$WORD]=$((${WORDS[$WORD]} + 1))
    fi
done

for WORD in ${!WORDS[@]}
do
    echo "$WORD ${WORDS[$WORD]}"
done | sort -rn -k2 | head -n 10 | cut -d " " -f1

exit 0
