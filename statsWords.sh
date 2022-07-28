#!/bin/bash

### This script takes the path of the text file to be procesed as an argument and returns a string
### showing the length of the word with the most, the least and the average characters. To achive
### this, the file is inserted in a while loop to iterate through its lines and a for loop to iterate
### over the words. Then we check if the word ends in a period, a comma, a colon, a semicolon or an
### ellipsis  and if so, the character is removed. After that we check if its the first word in the
### the text and in the affirmative case, we save the lenght of this first word to compare with the 
### rest later. If it's not the first iteration we compare the lenght of this new word with the we
### compare the lenght of this new word with the length stored in the variables created before.
### if the lenght of the new word is greater than the value stored in the variable, the value is
### updated to the new one, the same with the least charactes variable. We also add all the characters
### to make the average later. Finally we get the word count with the wc -w command and calculate the 
### average. Then the results are printed.

FILE=$1

FIRST_ITERATION=true

while read -ra LINE
do
    for WORD in "${LINE[@]}"
    do
        if [[ $WORD =~ [.]{3}$ ]]; then
            WORD=${WORD::-3}
        elif [[ $WORD =~ [,\.\;\:]$ ]]; then
            WORD=${WORD::-1}
        fi 

        if [ $FIRST_ITERATION = true ]; then
            FIRST_ITERATION=false
            LEAST_CHARACTERS=${#WORD}
            MOST_CHARACTERS=${#WORD}
            CHARACTER_LENGTH_ACCUMULATOR=${#WORD}
            continue
        fi

        if [ ${#WORD} -lt $LEAST_CHARACTERS ]; then
            LEAST_CHARACTERS=${#WORD}
        fi
        
        if [ ${#WORD} -gt $MOST_CHARACTERS ]; then
            MOST_CHARACTERS=${#WORD}
        fi

        CHARACTER_LENGTH_ACCUMULATOR=$(expr $CHARACTER_LENGTH_ACCUMULATOR + ${#WORD})
    done
done < $FILE

WORD_COUNT=$(cat text.txt | wc -w)
WORD_AVERAGE=$( expr $CHARACTER_LENGTH_ACCUMULATOR / $WORD_COUNT)

echo "The word with the MOST characters has $MOST_CHARACTERS characters."
echo "The word with the LEAST characters has $LEAST_CHARACTERS characters."
echo "The AVERAGE character length is $WORD_AVERAGE characters."
