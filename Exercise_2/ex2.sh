#!/bin/bash

divide_separate() {
fields_length=${#text_file[@]}
for (( i = 0; i < fields_length; i++)); do
    echo "field $((i + 1)) : ${text_file[i]}"
done

}

main() {
oldIFS=$IFS
separator="$1"
text_file="$2" 
IFS="$separator"
read -ra text_file < "$text_file"  
divide_separate "$text_file"
IFS="$oldIFS" 
}
main "$1" "$2"
