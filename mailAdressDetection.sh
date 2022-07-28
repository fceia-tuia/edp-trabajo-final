#!/bin/bash

### This script takes the path of the text file to be procesed as a parameter and returns a list
### of strings consisting of the words that matches with the description of an email adress. To 
### achive this, the file is inserted in a while loop to iterate through its lines and a for loop 
### to iterate over the words. Then we check if the word alredy is in the list previously defined.   
### If it isn't we check if the word ends in a period, a comma, a colon, a semicolon or an ellipsis
### and if so, the character is removed. 
### Then the word is compared with a regular expression. If the word matches the regex, it will be 
### added to the array previously defined. After serch for the entire text file the array is sorted  
### alphabetically. Finally the array containing only email adresses is printed in console.

FILE=$1

MAIL_ADRESS=()

while read -ra LINE
do
    for WORD in "${LINE[@]}"
    do
        if [[ " ${MAIL_ADRESS[*]} " =~ " $WORD " ]]; then
            continue
        fi
        
        if [[ $WORD =~ [.]{3}$ ]]; then
            WORD=${WORD::-3}
        elif [[ $WORD =~ [,\.\;\:]$ ]]; then
            WORD=${WORD::-1}
        fi  
        
        if [[ $WORD =~ ^[a-zA-Z0-9\!\#$%\&\'*+-/\=?^_\`\{|\}~]+@[a-z]+\.com(\.[a-z]+)*$ ]]; then
            MAIL_ADRESS+=( $WORD )
        fi
    done
done < $FILE

PREV_IFS=$IFS
IFS=$'\n'
MAIL_ADRESS_SORTED=($(sort <<<"${MAIL_ADRESS[*]}"))

for WORD in ${MAIL_ADRESS_SORTED[@]}
do
    echo $WORD
done

IFS=$PREV_IFS