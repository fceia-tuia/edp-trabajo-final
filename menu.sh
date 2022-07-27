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
        ./statsWords.sh $TEXT                                                    
    ;; 
    "Word usage stats")
        ./statsUsageWords.sh $TEXT
    ;; 
    "Find names")
        ./findNames.sh $TEXT
    ;; 
    "Sentence length stats")
        ./statsSentences.sh $TEXT
    ;; 
    "Blank lines counter")
        ./blankLinesCounter.sh $TEXT
    ;;  
    "Case converter") 
        ./caseConverter.sh $TEXT
    ;;  
    "Substring Replace")
        read -p "Enter a string to search in text: " SEARCH_STRING
        read -p "Enter a string to replace in text: " REPLACE_STRING
        read -p "Enter the name of the output file: " OUTPUT_FILE
        ./substringReplace.sh $TEXT $SEARCH_STRING $REPLACE_STRING $OUTPUT_FILE
    ;;  
    "Block selection")
        ./lockSelection.sh $TEXT
    ;;  
    "Palindrome detection")
        ./palindromeDetection.sh $TEXT
    ;; 
    "One vowel swords")
        ./oneVowelWords.sh $TEXT
    ;;  
    "All uppercase words")
        ./allUpperCase.sh $TEXT
    ;;  
    "All vowels Words")
        ./allVowelsInWord.sh $TEXT
    ;;  
    "Email adress detection")
        ./mailAdressDetection.sh $TEXT
    ;; 
    "Integer detection")
        ./integerDetection.sh $TEXT
    ;;
    "Exit")
        break
        
    ;;
    *)
        echo "Invalid entry"
        
    ;;

    esac
done

