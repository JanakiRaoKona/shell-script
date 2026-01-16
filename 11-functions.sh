#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

VALIDATE () {
    if [ $1 -ne 0 ]
        then 
            echo "$2 is failure....💔"
            exit 1
        else 
            echo "$2 is success...✅"
    fi

}

if [ $USERID -ne 0 ]
then 
    echo "Please run this script root user access"
    exit 1 # manually exit if errors come
else
    echo "Your super user"
fi
dnf install mysql-server -y &>>$LOGFILE

VALIDATE $? "Installing MYSQL server"

dnf install git -y
VALIDATE $? "Installing Git server" &>>$LOGFILE