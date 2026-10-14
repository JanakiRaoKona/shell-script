#!/bin/bash

var1=10
var2=20
var3="Siva"
echo "Total: $((var1+var2+var3))"

declare -i COUNT=5 #specifically declaring count as intiger
COUNT=COUNT+1
echo "Count : ${COUNT}"

FRUITS=("Apple" "Banana" "Papaya" "Orange") #list
echo "Fetch all fruits in the list: ${FRUITS[@]}"
echo "Fetch first fruit in the list: ${FRUITS[0]}"
