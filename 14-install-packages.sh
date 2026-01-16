#!/bin/bash

# Use all concepts till now we learning install some packages.
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAMP.log

USERID=$(id -u)

R="/e/[31m"
G="/e/[32m"
N="/e/[0m"
Y="/e/[33m"

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
    echo "Your super root user 🔥"
fi
echo "All packages: $@"

for i in $@
do
    echo "Package to install: $i"
    dnf list installed $i &>>$LOGFILE
    if [ $? -eq 0 ] 
        then
            echo "Already installed $Y skip.... $N the command"
        else
            echo "Need to install $Y packages.. $N"
    fi
done