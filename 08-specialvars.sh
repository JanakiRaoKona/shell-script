#!/bin/bash
#interview questions

echo "All variables: $@"
echo "Number of variables passed: $#"
echo "script name: $0"
echo "Current working directory: $PWD"
echo "Home directory of current user: $HOME"
echo "Which is user is running this script: $USER"
echo "Host name: $HOSTNAME"
echo "Process id of current shell script: $$"

sleep 60 &
echo "Process id of last background command: $!"