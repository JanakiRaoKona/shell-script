#!/bin/bash

# special vars 

echo "All args are passed to the script: ${@}"
echo "Number od args passed to the script: $#"
echo "First variable passed to the script: $1"
echo "script name $0"
echo "Real path: $(realpath $0)"
echo "who is running the current script: $USER"
echo "Directory of the current script:  $PWD"
echo "Home directory of the current script: $HOME"
echo "PID of the current script: $$"
sleep 10 &
echo "PID of the command runnig in background: $!"
wait $! #script wait until $! command complete
echo "Line number: $LINENO"
echo "Previous command exit status: $?"
echo "Total time executed for this script: $SECONDS"

