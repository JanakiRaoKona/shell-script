#!/bin/bash

# Use all concepts till now we learning install some packages.

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "Please run this script root user access"
    exit 1 # manually exit if errors come
else
    echo "Your super root user 🔥"
fi
echo "All packages: $@"