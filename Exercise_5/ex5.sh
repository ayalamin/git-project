#!/bin/bash

#function to generate a random number
random_number() {
        echo $(( (RANDOM % 100) + 1 ))
}

#initialize the size of the matrix
rows=$(( (RANDOM % 10) + 1))
col=$(( (RANDOM % 10) + 1))

#initialize the matrix
declare -A matrix

#initialize the matrix with random number
for ((i = 0; i<rows; i++)); do
        for ((j = 0; j<col; j++)); do
                matrix[$i,$j]=$(random_number)
        done
done

#print the matrix
for ((i=0; i<rows; i++)); do
        for ((j=0; j<col; j++)); do
                printf "%-5s" "${matrix[$i,$j]}"
        done
        printf "\n"
done
