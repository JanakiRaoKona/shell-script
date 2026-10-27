#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
usage_thresold=20

while IFS= read -r -line;
do
    usage=$(echo $line | awk '{print $6}' | cut -d "%" -f)
    partition=$(echo $line | awk '{print $7}')
    if [ $usage -ge $usage_thresold];
        then 
            msg+="High disk usage on $partition :: $usage \n"
        else  
done <<<"$disk_usage" 
echo -e $msg 
