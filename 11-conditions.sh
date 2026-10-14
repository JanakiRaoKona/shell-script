#!/bin/bash

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

echo "Proceeding..."
dnf install nginxxxx -y

if [ $? -ne 0 ]; then 
    echo "Nginx installation is failed..."
    exit 1
else
    echo "Nginx installation is success..."

    
dnf install mysqlll -y

if [ $? -ne 0 ]; then 
    echo "MySql client installation is failed..."
    exit 1
else
    echo "MySql client installation is success..."

echo "is Still proceeding..."
