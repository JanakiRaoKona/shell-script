#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
dest_dir=$2
days=${3:-14} # if user is not passing days we will take 14 is default days 

usage () {

    echo -e "${R}USAGE:: $0 [source_dir] [dest_dir] [days ( optional , default to 14 days )]${N}"
    exit 1 
}

if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then 
    echo "either source or dest_dir are missing..."
    usage
  
fi

if [ ! -d  "${source_dir}" ]; then  # -d means dir is exist 
    echo -e "${R}[ERR]:: ${source_dir} is does not exist.${N}"

fi

if [ ! -d  "${dest_dir}" ]; then  # -d means dir is exist 
    echo -e "${R}[ERR]:: ${dest_dir} is does not exist.${N}"

fi
echo "Scanning  a files older than $days in $source_dir"
files_to_archieve=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "${files_to_archieve}" ]; then 
    echo -e "No logs file found... older than $days days"
    exit 0
fi
