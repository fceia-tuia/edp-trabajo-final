#!/bin/bash

FIRST_ITERATION=true
WORD_COUNTER=0

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do  
        echo $WORD

        if [[ $WORD =~ ^.*[\.][" "]?$ ]]
        then
            echo "----------------sentence reached----------------"
            if [ $FIRST_ITERATION = true ]
            then
                SENTENCE_COUNTER=1
                WORD_ACCUMULATOR=$WORD_COUNTER
                MOST_WORDS=$WORD_COUNTER
                LEAST_WORDS=$WORD_COUNTER
                FIRST_ITERATION=false
                continue
            fi
            
            if [ $WORD_COUNTER -lt $LEAST_WORDS ]
            then
                LEAST_WORDS=$WORD_COUNTER
            fi

            if [ $WORD_COUNTER -gt $MOST_WORDS ]
            then
                MOST_WORDS=$WORD_COUNTER
            fi            

            let SENTENCE_COUNTER++
            WORD_ACCUMULATOR=$( expr $WORD_ACCUMULATOR + $WORD_COUNTER)
            WORD_COUNTER=0
            continue        
        fi        

        let WORD_COUNTER++

    done;

done < text.txt

WORD_AVERAGE=$( expr $WORD_ACCUMULATOR / $SENTENCE_COUNTER)

echo "The number of lines is $SENTENCE_COUNTER"
echo "The sentence with the MOST words has $MOST_WORDS words."
echo "The word with the LEAST characters has $LEAST_WORDS characters."
echo "The AVERAGE character length is $WORD_AVERAGE characters."