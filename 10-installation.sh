#!/bin/bash

# install mysql server

USERID=$(id -u)

VALIDATE () {
    if [$1 -eq 0]
        then 
            echo "$2 is failure....💔"
            exit 1
        else 
            echo "$2 is success...✅"
    fi
        echo "is script proceeding..?"

}

if [ $USERID -ne 0 ]
then 
    echo "Please run this script root user access"
    exit 1 # manually exit if errors come
else
    echo "Your super user"
fi
dnf install mysql-server -y

VALIDATE $? "Installing Mysql server"

# if [ $? -ne 0 ]
# then 
#     echo "installation of my sql is failure...💔"
#     exit 1 # manually exit if errors come
# else 
#     echo "installation of my sql is success"
# fi

dnf install git -y
VALIDATE $? "Installing Git server"
# if [ $? -ne 0 ]
# then 
#     echo "installation of my git is failure...💔"
#     exit 1 # manually exit if errors come
# else 
#     echo "installation of my git is success"
# fi
