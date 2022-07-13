#!/bin/bash

TEXT=$1

grep -cvE '[^[:space:]]' <<< "$TEXT"