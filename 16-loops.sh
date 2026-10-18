#!/bin/bash

user_id=$(id -u)

logs_folder="/var/log/shell-script"
logs_file="${logs_folder}/${0}.log"

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

mkdir -p "${logs_folder}"

echo "Script exection starting time $(date +"%F %T")" &>> $logs_file

validate () {
    
    if [ $? -ne 0 ]; then 
        echo "${2}...FAILED" | tee -a $logs_file
        exit 1
    else
        echo "${2}...SUCCESS" | tee -a $logs_file
    fi
}

for package in "${@}"
do 
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then 
        echo "Going to install: ${package}"
        dnf install $package -y &>> $logs_file
        validate $? "${package} installation"
    else 
        echo "${package} is already installed...SKIPPING}"
    fi
done 
    