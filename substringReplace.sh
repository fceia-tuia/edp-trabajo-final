#!/bin/bash

SEARCH_STRING=$1
REPLACE_STRING=$2


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

echo $SEARCH_STRING_REGEX

sed -e "s/$SEARCH_STRING_REGEX/$REPLACE_STRING/" text.txt > output.txt
sed -i 's/[^[:print:]]//g' output.txt