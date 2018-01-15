#!/bin/bash
#Question 13
for folder in `echo $PATH | sed 's/:/ /g'`; do
        if [ -f "$folder/$1" ] && [ `ls -l $folder/$1 | cut -f 1 -d ' ' | grep -c x` -eq 1 ]; then
                echo $folder/$1
                exit 0
        fi
done