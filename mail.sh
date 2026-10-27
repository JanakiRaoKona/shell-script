#!/bin/bash

to_team=$1
server_ip=$2
alert_type=$3
message=$4
to_address=$5
subject=$6

safe_message=$(echo "$message" | sed 's/[^a-zA-Z0-9 ]//g')

final_body=$(sed -e "s/TO_TEAM/$to_team/g" -e "s/ALERT_TYPE/$alert_type/g" -e "s/SERVER_IP/$server_ip/g" -e "s/MESSAGE_BODY/$safe_message/g" templete.html)

{
echo "To: $to_address"
echo "Subject: $subject"
echo "Content-Type: text/html"
echo ""
echo "$final_body"
} | msmtp "$to_address"