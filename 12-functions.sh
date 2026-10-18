#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

validate () {
    
    if [ $? -ne 0 ]; then 
        echo "${2}...FAILED"
        exit 1
    else
        echo "${2}...SUCCESS"
    fi
}

echo "Proceeding..."
dnf install nginx -y
validate $? "Nginx installation"

dnf install mysql -y
validate $? "Msql installation"

echo "is Still proceeding..."