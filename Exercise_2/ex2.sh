#!/bin/bash

oldIFS=$IFS
IFS=';' 

divide_saperate() {
read -ra fields <<< "$@"
fields_length=${#fields[@]}
for (( i = 0; i < fields_length; i++)); do
    echo "field $((i + 1)) : ${fields[i]}"
done

}

divide_saperate


IFS="$oldIFS" 
