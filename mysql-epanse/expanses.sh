#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(basename $0 .sh)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE () {
    if [ $1 -ne 0 ]
    then
        echo -e "${R}$2 failed ❌${N}"
        exit 1
    else
        echo -e "${G}$2 success ✅${N}"
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "${R}Please run this script with root access${N}"
    exit 1
else
    echo -e "${G}Your super root user 🔥${N}"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing MYSQL Server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enable MYSQL Server"

systemctl start mysqld -y &>>$LOGFILE
VALIDATE $? "Start MYSQL Server"

mysql_secure_installation --set-root-pass ExpenseApp@1 -y &>>$LOGFILE
VALIDATE $? "Password setup MYSQL Server"