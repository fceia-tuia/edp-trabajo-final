#!/bin/bash

TEXT=$(cat $1)

grep -cvE '[^[:space:]]' <<< "$TEXT"
