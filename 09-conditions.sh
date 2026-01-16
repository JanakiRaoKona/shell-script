#!/bin/bash

NUMBER=$1

then [ $NUMBER -gt 10 ]
    echo "Given number: $NUMBER is more than 10"
else
    echo "Given number: $NUMBER is less than 10"

fi