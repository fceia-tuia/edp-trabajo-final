#!/bin/bash

echo "Select by sentence (O) or paragraph (P)? "
read SELECTION

SELECTION=$(echo $SELECTION | tr '[:lower:]' '[:upper:]')

# [[ $SELECTION -ne "O" || $SELECTION -ne "P" ]] && exit 1
TEXT=$(cat $1)
ELEMENTS=()
case $SELECTION in
    [Oo])
        DELIMITER='. '
        TEXT_COPY=$TEXT$DELIMITER
        while [[ $TEXT_COPY ]]; do
            ELEMENTS+=("${TEXT_COPY%%"$DELIMITER"*}");
            TEXT_COPY=${TEXT_COPY#*"$DELIMITER"};
        done;
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
