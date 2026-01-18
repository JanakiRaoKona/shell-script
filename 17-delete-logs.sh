#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=/tmp/app-logs

if [ -d $SOURCE_DIRECTORY ]
    then 
        echo -e "$G Source directory exists $N"
    else
        echo -e "$R Please make sure $SOURCE_DIRECTORY exists $N"
        exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -type f -mtime +7)
echo "Files to delete $FILES"



# while read line; do  
#   ARRAY[$c]="$line"
#   c=$((c+1))  
# done < <(tcpdump -n -r "$pcap")

while IFS= read -r line
do
	echo "Deleting Files $line"
done <<< $FILES
