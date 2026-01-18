#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=/tmp/app-logs

if [ -d $SOURCE_DIRECTORY ]
    then 
        echo "$G Source directory exists $N"
    else
        echo "$R Please make sure $SOURCE_DIRECTORY exists $N"
        exit 1
fi