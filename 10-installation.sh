#!/bin/bash

# install mysql server

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script root user access"
else
    echo "Your super user"
fi
dnf install mysql-server -y