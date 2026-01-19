#!/bin/bash

MOVIES=( "RRR" , "Bahubali" , "Varanasi" )

# in array indexes are start with zero
# size of array count with 1 

echo "first movie name: ${MOVIES[0]}"
echo "second movie name: ${MOVIES[1]}"
echo "all movies: ${MOVIES[@]}"