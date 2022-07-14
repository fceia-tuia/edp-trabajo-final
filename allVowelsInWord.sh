#!/bin/bash
TEXT=$1

WORDS_WITH_ALL_VOWELS=()


for WORD in $TEXT
do
      
    if [[ $(echo grep -i a $WORD | grep -i e | grep -i i | grep -i o | grep -i u) ]]
    then
        
        WORDS_WITH_ALL_VOWELS+=("$WORD")
        
    fi

done

# WORDS_IN_ALPHABETIC_ORDER=($(echo ${WORDS_WITH_ALL_VOWELS[@]} | sort))
# echo ${WORDS_IN_ALPHABETIC_ORDER[@]}

# sorted=($(sort <<< ${WORDS_WITH_ALL_VOWELS[@]}))
# echo "${sorted[@]}"

echo 'Todas las palabras' ${WORDS_WITH_ALL_VOWELS[@]}


