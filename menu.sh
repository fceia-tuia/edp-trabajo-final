#!/bin/bash

TEXT=$1

PS3='Your choice > '
CONTINUE=true
while $CONTINUE
do
    clear
    select TOOL in "Word length stats" "Word usage stats" "Find names" "Sentence length stats" \
    "Blank lines counter" "Case converter" "Substring Replace" "Block selection" "Palindrome detection" \
    "One vowel words" "All uppercase words" "All vowels Words" "Email adress detection" "Integer detection" \
    "Exit"
    do
        case $TOOL in
        "Word length stats")
            ./statsWords.sh $TEXT
            break
        	;;
        "Word usage stats")
            ./statsUsageWords.sh $TEXT
            break
        	;;
        "Find names")
            ./findNames.sh $TEXT
            break
        	;;
        "Sentence length stats")
            ./statsSentences.sh $TEXT
            break
        	;;
        "Blank lines counter")
            ./blankLinesCounter.sh $TEXT
            break
        	;;
        "Case converter")
            ./caseConverter.sh $TEXT
            break
        	;;
        "Substring Replace")
            read -p "Enter a string to search in text: " SEARCH_STRING
            read -p "Enter a string to replace in text: " REPLACE_STRING
            ./substringReplace.sh $TEXT $SEARCH_STRING $REPLACE_STRING $OUTPUT_FILE
            break
        	;;
        "Block selection")
            ./blockSelection.sh $TEXT
            break
        	;;
        "Palindrome detection")
            ./palindromeDetection.sh $TEXT
            break
        	;;
        "One vowel words")
            ./oneVowelWords.sh $TEXT
            break
        	;;
        "All uppercase words")
            ./allUpperCase.sh $TEXT
            break
        	;;
        "All vowels Words")
            ./allVowelsInWord.sh $TEXT
            break
        	;;
        "Email adress detection")
            ./mailAdressDetection.sh $TEXT
            break
        	;;
        "Integer detection")
            ./integerDetection.sh $TEXT
            break
        ;;
        "Exit")
            CONTINUE=false
            break
        ;;
        *)
            echo "Invalid entry"
            break
        ;;

        esac
    done
    echo ""
    echo "PRESS ENTER TO CONTINUE"
    read
done
