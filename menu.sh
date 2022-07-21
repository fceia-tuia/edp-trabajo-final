#!/bin/bash

PS3='Your choice > '

select tool in "Word length stats" "Word usage stats" "Find names" "Sentence length stats" \
"Blank lines counter" "Case converter" "Substring Replace" "Block selection" "Palindrome detection" \
"One vowel swords" "All uppercase words" "All vowels Words" "Email adress detection" "Integer detection" \
"Exit"  
do
    case $tool in
    "Word length stats")     
        
    ;; 
    "Word usage stats")
        
    ;; 
    "Find names")
        echo ""
    opción elegida  ;; 
    "Sentence length stats")
        
    ;; 
    "Blank lines counter")
        
    ;;  
    "Case converter")

    ;;  
    "Substring Replace")
        
    ;;  
    "Block selection")
        
    ;;  
    "Palindrome detection")
        
    ;; 
    "One vowel swords")
        
    ;;  
    "All uppercase words")
        
    ;;  
    "All vowels Words")
        
    ;;  
    "Email adress detection")
        
    ;; 
    "Integer detection")
        
    ;;
    "Exit")
        break
        
    ;;
    *)
        echo "Invalid entry"
        
    ;;

    esac
done

