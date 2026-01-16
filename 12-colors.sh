#!/bin/bash

# interview level stuff practice how to store the logs and check the commands proper validations

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="/e/[31m"
G="/e/[32m"
N="/e/[0m"

echo "shell script started sxecuting here: $TIMESTAMP"

VALIDATE () {
    if [ $1 -ne 0 ]
        then 
            echo -e "$2 is $R failure....💔 $N"
            exit 1
        else 
            echo -e "$2 is $G success...✅ $N"
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

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git server"

dnf install wrong-command -y &>>$LOGFILE
VALIDATE $? "Installing Git server"