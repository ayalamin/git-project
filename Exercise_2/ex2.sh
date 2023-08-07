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
if [ $# -ne 2 ]; then
    echo "Usage: $0 <separator> <name_of_file>"
    exit 1
fi

main "$1" "$2"
