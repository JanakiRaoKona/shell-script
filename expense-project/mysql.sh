#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 $R failed ❌ $N"
        exit 1
    else
        echo -e "$2 $G success... ✅ $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R Please run this script with root access. $N"
    exit 1
else
    echo -e "Your super $G root user. 🔥$N"
fi

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing MYSQL Server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enable MYSQL Server"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "Start MYSQL Server"

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "Set root password MYSQL Server"