#!/bin/bash

user_id=$(id -u)

logs_folder="/var/log/shell-script"
logs_file="${log_folder}/${0}.log"


if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

mkdir -p $ $logs_folder
echo "${logs_file}"


echo "Script exection starting time $(date +"%F %T")" &>> $logs_file

validate () {
    
    if [ $? -ne 0 ]; then 
        echo "${2}...FAILED" | tee -a $logs_file
        exit 1
    else
        echo "${2}...SUCCESS" | tee -a $logs_file
    fi
}

dnf install nginx -y &>> $logs_file
validate $? "Nginx installation"

dnf install mysql -y &>> $logs_file
validate $? "Msql installation"

echo "Script exection completed time $(date +"%F %T")" &>> $logs_file

