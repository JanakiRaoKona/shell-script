#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
days=${2:-14} # if user is not passing days we will take 14 is default days 

usage () {

    echo -e "${R}USAGE:: $0 [source_dir] [days ( optional , default to 14 days )]${N}"
    exit 1 
}

if [ -z "${source_dir}" ]; then  # -z means empty dir 
    echo "ERR:: Missing Parameters"
    usage
fi

if [ ! -d  "${source_dir}" ]; then  # -d means dir is exist 
    echo -e "${R}ERR:: ${source_dir} is does not exist.${N}"

fi

echo "Scanning  a files older than $days in $source_dir"
files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +$days)


if [ -z "${files_to_delete}" ]; then 
    echo -e "No logs file found... older than $days"
    exit 0
fi

while IFS= read -r line;
do
    echo "File is going to be deleted: $line"
    rm -r $line
    echo "File deleted: $line"
done <<< $files_to_delete

# < ---> for file as a input
# <<< ---> for variable as input 




