#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(basename $0 .sh)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "${R}Please run this script with root access${N}"
    exit 1
else
    echo -e "${G}Your super root user 🔥${N}"
fi

echo "All packages: $@"

for i in "$@"
do
    echo "Package to install: $i"
    dnf list installed $i &>>$LOGFILE

    if [ $? -eq 0 ]
    then
        echo -e "${Y}Already installed${N} → skip the command"
    else
        echo -e "${G}Installing${N} $i"
        dnf install $i -y &>>$LOGFILE

        if [ $? -eq 0 ]
        then
            echo -e "${G}$i installed successfully ✅${N}"
        else
            echo -e "${R}$i installation failed ❌${N}"
            exit 1
        fi
    fi
done
