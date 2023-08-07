#!/bin/bash

oldIFS=$IFS
IFS=';' 
read -ra fields <<< "$@"

divide_saperate() {
fields_length=${#fields[@]}
for (( i = 0; i < fields_length; i++)); do
    echo "field $((i + 1)) : ${fields[i]}"
done

}


IFS="$oldIFS" 
divide_saperate
