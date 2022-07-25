#!/bin/bash

TEXT=$1

PS3='Your choice > '

select tool in "Word length stats" "Word usage stats" "Find names" "Sentence length stats" \
"Blank lines counter" "Case converter" "Substring Replace" "Block selection" "Palindrome detection" \
"One vowel swords" "All uppercase words" "All vowels Words" "Email adress detection" "Integer detection" \
"Exit"  
do
    case $tool in
    "Word length stats")     
        source statsWords.sh $TEXT                                                    
    ;; 
    "Word usage stats")
        source statsUsageWords.sh $TEXT
    ;; 
    "Find names")
        source findNames.sh $TEXT
    ;; 
    "Sentence length stats")
        source statsSentences.sh $TEXT
    ;; 
    "Blank lines counter")
        source blankLinesCounter.sh $TEXT
    ;;  
    "Case converter") 
        source caseConverter.sh $TEXT
    ;;  
    "Substring Replace")
        read -p "Enter a string to search in text: " SEARCH_STRING
        read -p "Enter a string to replace in text: " REPLACE_STRING
        read -p "Enter the name of the output file: " OUTPUT_FILE
        source substringReplace.sh $TEXT $SEARCH_STRING $REPLACE_STRING $OUTPUT_FILE
    ;;  
    "Block selection")
        source lockSelection.sh $TEXT
    ;;  
    "Palindrome detection")
        source palindromeDetection.sh $TEXT
    ;; 
    "One vowel swords")
        source oneVowelWords.sh $TEXT
    ;;  
    "All uppercase words")
        source allUpperCase.sh $TEXT
    ;;  
    "All vowels Words")
        source allVowelsInWord.sh $TEXT
    ;;  
    "Email adress detection")
        source mailAdressDetection.sh $TEXT
    ;; 
    "Integer detection")
        source integerDetection.sh $TEXT
    ;;
    "Exit")
        break
        
    ;;
    *)
        echo "Invalid entry"
        
    ;;

    esac
done

