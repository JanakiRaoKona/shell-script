#!/bin/bash
# in shell scripts no need to worry about data types if apply string it will
# convert to int ans should be showing 0

NUM1=$1
NUM2=$2

SUM=$(($NUM1+$NUM2))

echo "sum of ${NUM1} and ${NUM2} is $SUM"