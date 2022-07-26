#!/bin/bash

### In this script we prompt the user to select a sentence (O/o)
### or a paragraph (P/p) and then again to select which position,
### starting from 0, wants to display. If the user inputs an invalid
### value (different than O/P/o/p in the first prompt and not a number
### or number out of range in the second prompt) the program will
### exit with status code of 1.
### After selecting a valid value for the first prompt, we split the
### text into the corresponding elements (paragraphs or sentences), based
### the selection. Those elements will be placed on an array and with
### a valid input on the second prompt it will display the value on
### that position.

echo "Select by sentence (O) or paragraph (P)? "
read SELECTION

SELECTION=$(echo $SELECTION | tr '[:lower:]' '[:upper:]')

[[ $SELECTION -ne "O" || $SELECTION -ne "P" ]] && exit 1
TEXT=$(cat $1 | sed '/^[[:space:]]*$/d')
ELEMENTS=()
case $SELECTION in
    [Oo])
        DELIMITER='. '
        TEXT_COPY=$TEXT$DELIMITER
        while [[ $TEXT_COPY ]] 
        do
            ELEMENTS+=("${TEXT_COPY%%"$DELIMITER"*}")
            TEXT_COPY=${TEXT_COPY#*"$DELIMITER"}
        done
        ;;
    [Pp])
        readarray -t ELEMENTS <<< $TEXT
        ;;
    *)
        exit 1
        ;;
esac

echo "Position? "
read POSITION

[[ ! $POSITION =~ ^[0-9]+$ ]] && exit 1

[[ $POSITION -ge ${#ELEMENTS[@]} ]] && exit 1

echo ${ELEMENTS[$POSITION]}
