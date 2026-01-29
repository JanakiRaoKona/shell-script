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
        echo -e "$R Please make sure $SOURCE_DIRECTORY is exists $N"
        exit 1
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.logs")
echo "Files to delete $FILES"



# while read line; do  
#   ARRAY[$c]="$line"
#   c=$((c+1))  
# done < <(tcpdump -n -r "$pcap")

while IFS= read -r line
do
	echo "Deleting Files $line"
    rm -rf $line
done <<< $FILES


# find $SOURCE_DIRECTORY -name "*.logs" -type f -mtime +7