# interview concept questions 

#!/bin/bash
COURSE="DevOps from current script"

echo "Before calling other scripts : $COURSE"

echo "Process ID of current shell script: $$"

# ./16-other-script.sh # method one 

source ./16-other-script.sh # 2 nd method

echo "After calling other scripts : $COURSE"

