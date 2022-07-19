#!/bin/bash

if [[ $1 =~ ^[a-zA-Z0-9\!\#$%\&\'*+-/\=?^_\`\{|\}~]+@[a-z]+\.com(\.[a-z]+)*$ ]]
then 
    echo "REGEX DETECTED"
else
    echo "REGEX NOT DETECTED"
fi