#!/bin/bash

### In this script, we use a text from an enter file and read its lines.
### Next, we evaluate every word in each line. We use an iterative structure to analyze every character of that word.
### If the current character is an uppercase letter (with or without accentuation), 
### then the WORDCHANGE variable will save its value but turned to lowercase and vice verse.
### If the current character is not a letter, it won't be changed and will just be added to the WORDCHANGED variable.
### After, we add every WORDCHANGED that we get from the current line to the SENTENCE variable that we previously defined.
### Finally, we send a print of the sentence to an out file.


FILE=$1

while read -ra LINE; 
do
    SENTENCE=""
    for WORD in "${LINE[@]}";
    do
        WORDCHANGED="" 
        for (( i=0; i<${#WORD}; i++ )) ; do
            if [[ ${WORD:$i:1} =~ ^[A-ZÄËÏÖÜÁÉÍÓÚÂÊÎÔÛÀÈÌÒÙÑ]+$ ]]
            then
                WORDCHANGED+=$(echo ${WORD:$i:1} | tr '[:upper:]' '[:lower:]')
            elif  [[ ${WORD:$i:1} =~ ^[a-zäëïöüáéíóúáéíóúâêîôûàèìòùñ]+$ ]]
            then
                WORDCHANGED+=$(echo ${WORD:$i:1} | tr '[:lower:]' '[:upper:]')
            else
                WORDCHANGED+=${WORD:$i:1}                
            fi
        done

        SENTENCE+="$WORDCHANGED "
    done;
    echo $SENTENCE >> output.txt
done < $FILE 

