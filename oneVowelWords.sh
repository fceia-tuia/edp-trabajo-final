#!/bin/bash

### This script takes the path of the text file to be procesed as a parameter and returns a list
### of strings consisting of the words that contains only one vowel. To achive this, the file is
### inserted in a while loop to iterate through its lines and a for loop to iterate over the words.
### Then we check if the word alredy is in the list previously defined. If it isn't we check if  
### the word ends in a period or a comma and if so, the character is removed. Then the word is 
### passed through a series of filters. If the word has only one vowel it will be added to the array
### previously defined. After serch for the entire text file the array is sorted alphabetically. 
### Finally the array containing only words with one vowel is printed in console.


FILE=$1

ONE_VOWEL=()

while read -ra LINE; 
do
    for WORD in "${LINE[@]}";
    do
        if [[ " ${ONE_VOWEL[*]} " =~ " $WORD " ]]; then
            continue
        fi

        if [ ${#WORD} -gt 3 ]
        then 
            if [[ $WORD =~ [,.]$ ]]
            then
                WORD=${WORD::-1}
            fi 

            ONE_VOWEL+=( $( echo $WORD | grep -vi '[eiouéíóú0-9]' ) )
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aiouáíóú0-9]' ) )
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aeouáéóú0-9]' ) ) 
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aeiuáéíú0-9]' ) )
            ONE_VOWEL+=( $( echo $WORD | grep -vi '[aeioáéíó0-9]' ) )  
        fi
    done;
done < $FILE

IFS=$'\n' ONE_VOWEL_SORTED=($(sort <<<"${ONE_VOWEL[*]}"))

for WORD in ${ONE_VOWEL_SORTED[@]}
do
    echo $WORD
done