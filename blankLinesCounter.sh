#!/bin/bash

### In this script we use grep to count (-c) how many
### lines do not match (-v) the regex (-E) where the
### regex matches with any line that contains non-space.
### Meaning that it will count how many blank lines we have

grep -cvE '[^[:space:]]' $1
