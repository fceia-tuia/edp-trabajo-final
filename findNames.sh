#!/bin/bash

WORD=$1

if [[ $WORD =~ ^([A-Z]{1}||[ÄËÏÖÜÁÉÍÓÚÂÊÎÔÛÀÈÌÒÙÑ]{2})[a-zäëïöüáéíóúáéíóúâêîôûàèìòùñ]+$ ]]
then
    echo "It's an own name"
else
    echo "It isn't an own name"
fi