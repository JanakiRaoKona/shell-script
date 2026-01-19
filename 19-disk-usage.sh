#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THREASOLD=20
MESSAGE=""
while IFS= read -r line
do
USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
FOLDER=$(echo $line | awk -F " " '{print $NF}')
if [ $USAGE -ge $DISK_THREASOLD ]
then 
    MESSAGE="$FOLDER is greatet than $DISK_THREASOLD current usage: $USAGE"
fi


done <<< $DISK_USAGE
echo "Message: $MESSAGE"