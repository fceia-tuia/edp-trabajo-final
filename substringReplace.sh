#!/bin/bash

### This script takes the path of the text file to be procesed, the substirng to search,
### the substring to replace, and the name of the output file as parameters, and returns
### text file with the replace done. To achive this we conform the regex adding the accentuated
### vowels, both lowercase and uppercase, to the string that was passed as a parameter.
### Then we use the sed command to search and replace the seach substring regex with the
### replace string passed as a parameter. Finally we remove the non printable characters from
### the output file.


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
