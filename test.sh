#!/bin/bash

FILE=$1
SEARCH_STRING=$2
REPLACE_STRING=$3
OUTPUT_FILE=$4


SEARCH_STRING_REGEX="${SEARCH_STRING/'a'/'[aá]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'e'/'[eé]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'i'/'[ií]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'o'/'[oó]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'u'/'[uú]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'A'/'[AÁ]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'E'/'[EÉ]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'I'/'[IÍ]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'O'/'[OÓ]'}"
SEARCH_STRING_REGEX="${SEARCH_STRING_REGEX/'U'/'[UÚ]'}"
SEARCH_STRING_REGEX=$( printf $SEARCH_STRING_REGEX )

sed -e "s/$SEARCH_STRING_REGEX/$REPLACE_STRING/" $FILE > $OUTPUT_FILE
sed -i 's/[^[:print:]]//g' $OUTPUT_FILE


# FILE=$1

# while read -ra LINE; 
# do
#     for WORD in "${LINE[@]}";
#     do
#         echo $WORD 
#     done;
#     echo "\n"
# done < $FILE 

# declare -A ARRAY

# ARRAY["Messi"]=10
# ARRAY["Di María"]=11
# ARRAY["Paredes"]=5
# ARRAY["Martínez"]=1

# # For every key in the associative array..
# for KEY in "${!ARRAY[@]}"; do
#   # Print the KEY value
#   echo "Key: $KEY"
#   # Print the VALUE attached to that KEY
#   echo "Value: ${ARRAY[$KEY]}"
# done
