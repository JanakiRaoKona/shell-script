#!/bin/bash

user_id=$(id -u)

logs_folder="/var/log/shell-script"
logs_file="${log_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

mkdir $ $logs_folder

echo "Script exection starting time $(date +"%F "T)"

validate () {
    
    if [ $? -ne 0 ]; then 
        echo "${2}...FAILED" | tee -a $logs_file
        exit 1
    else
        echo "${2}...SUCCESS" | tee -a $logs_file
    fi
}

echo "Proceeding..."
dnf install nginx -y &>> $logs_file
validate $? "Nginx installation"

dnf install mysql -y &>> $logs_file
validate $? "Msql installation"

echo "Script exection completed time $(date +"%F "T)"

echo "is Still proceeding..."