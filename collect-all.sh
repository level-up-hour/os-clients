#!/bin/bash
DIRECTORY=$1
echo collecting from $DIRECTORY

for file in `ls $DIRECTORY`; do
    echo collecting $DIRECTORY/$file
    $DIRECTORY/$file
    if [ $? -ne 0 ]
    then
        echo "$file failed to execute properly" >&2
        exit 1
    fi
done

