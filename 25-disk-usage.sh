#!/bin/bash

disk_usage=$(df -hT | grep -v Filesystem)
usage_thresold=20
server_ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)


while IFS= read -r line
do
    usage=$(echo $line | grep -v Filesystem | awk '{print $6}' | cut -d "%" -f1)
    partition=$(echo $line | awk '{print $7}')
    if [ "$usage" -ge "$usage_thresold" ];
        then 
            msg+="High disk usage on $partition :: $usage <br>"
    fi
done <<< "$disk_usage" 

# echo -e $msg 

sh mail.sh "DevOps Team" "$server_ip" "High Disk Usage" "$msg" "konajanakirao@gmail.com" "WARNING: High Disk Usage alert"