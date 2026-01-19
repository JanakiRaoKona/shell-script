#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THREASOLD=75

while IFS= read -r line
do
USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
FOLDER=$(echo $line | awk -F " " '{print $NF}')
if [ $USAGE -ge $DISK_THREASOLD ]
then 
    echo "$FOLDER is greatet than $DISK_THREASOLD current usage: $USAGE"

done <<< $DISK_USAGE