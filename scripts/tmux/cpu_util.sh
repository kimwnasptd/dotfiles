#!/bin/bash

#SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
#top -bn1 | $SCRIPT_DIR/cpu_util.py

top -l 1 -s 0 -n 0 | grep CPU
