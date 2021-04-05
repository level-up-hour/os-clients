#!/bin/bash
DIRECTORY=$1
echo collecting from $DIRECTORY

for file in `ls $DIRECTORY`; do
    echo collecting $DIRECTORY/$file
    $DIRECTORY/$file
done

