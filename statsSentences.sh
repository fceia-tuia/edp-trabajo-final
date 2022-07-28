#!/bin/bash

### This script takes the path of the text file to be procesed as an argument and returns a string
### showing the amount of words in the sentence with the most, the least and the average words. 
### To achive this, the file is inserted in a while loop to iterate through its lines and a for loop 
### to iterate over the words. Then we check if the word ends in a period and if not, we add 1 to the 
### word counter. If the previous condition is reached it means that we alredy got a sentence. If
### it's the first sentence we save in variables the first counting of words and set the sentence count
### to 1. If not, we compare the current counting with the amount of words stored in the variables
### corresponding with the least and the most amount of words in a sentence. Also we add 1 to the sentence
### counter and the amount of words to the word total, before restarting the word counter.  
### Finally we calculate the average and then the results are printed.

FILE=$1

FIRST_ITERATION=true
WORD_COUNTER=0

while read -ra LINE
do
    for WORD in "${LINE[@]}"
    do
        if [[ $WORD =~ ^.*[\.][" "]?$ ]]; then
            if [ $FIRST_ITERATION = true ]; then
                SENTENCE_COUNTER=1
                WORD_ACCUMULATOR=$WORD_COUNTER
                MOST_WORDS=$WORD_COUNTER
                LEAST_WORDS=$WORD_COUNTER
                FIRST_ITERATION=false
                continue
            fi
            
            if [ $WORD_COUNTER -lt $LEAST_WORDS ]; then
                LEAST_WORDS=$WORD_COUNTER
            fi

            if [ $WORD_COUNTER -gt $MOST_WORDS ]; then
                MOST_WORDS=$WORD_COUNTER
            fi            

            let SENTENCE_COUNTER++
            WORD_ACCUMULATOR=$( expr $WORD_ACCUMULATOR + $WORD_COUNTER)
            WORD_COUNTER=0
            continue        
        fi        

        let WORD_COUNTER++
    done
done < $FILE

WORD_AVERAGE=$( expr $WORD_ACCUMULATOR / $SENTENCE_COUNTER )

echo "The sentence with the MOST words has $MOST_WORDS words."
echo "The word with the LEAST characters has $LEAST_WORDS words."
echo "The AVERAGE character length is $WORD_AVERAGE words."