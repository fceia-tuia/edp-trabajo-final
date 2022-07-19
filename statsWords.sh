#!/bin/bash

FILE=$1

FIRST_ITERATION=true

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do
        if [ $FIRST_ITERATION = true ]
        then
            FIRST_ITERATION=false
            LEAST_CHARACTERS=${#WORD}
            MOST_CHARACTERS=${#WORD}
            CHARACTER_LENGTH_ACCUMULATOR=${#WORD}
            continue
        fi

        if [ ${#WORD} -lt $LEAST_CHARACTERS ]
        then
            LEAST_CHARACTERS=${#WORD}
        fi
        
        if [ ${#WORD} -gt $MOST_CHARACTERS ]
        then
            MOST_CHARACTERS=${#WORD}
        fi

        CHARACTER_LENGTH_ACCUMULATOR=$(expr $CHARACTER_LENGTH_ACCUMULATOR + ${#WORD})
    done;
done < $FILE

WORD_COUNT=$(cat text.txt | wc -w)
WORD_AVERAGE=$( expr $CHARACTER_LENGTH_ACCUMULATOR / $WORD_COUNT)

echo "The word with the MOST characters has $MOST_CHARACTERS characters."
echo "The word with the LEAST characters has $LEAST_CHARACTERS characters."
echo "The AVERAGE character length is $WORD_AVERAGE characters."
