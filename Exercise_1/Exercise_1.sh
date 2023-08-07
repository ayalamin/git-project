#!/bin/bash

#check if input is a url
is_url() {
    input="$1"
 if [[ "$input" =~ ^https?:// ]]; then
        return 0
    else
        return 1 
    fi
}




# check if there is enouf arguments from user
if [ $# -lt 2 ]; then
    echo "Error: Not enough arguments."
    exit 1
fi

# Get the directory
direction="$1"

# check if directory is exists
if [ ! -d "$direction" ]; then
    echo "Error: directory does not exist."
    exit 1
fi


for ((i = 2; i <= $#; i++)); do
    url="${!i}"
    if ! is_url "$url"; then
        echo "Error: Invalid URL $url."
    fi
done


mkdir downloads/
cd downloads/


for ((i = 2; i <= $#; i++)); do
    url="${!i}"
    if ! wget "$url"; then
        echo "Error: Invalid URL $url."
    fi
done

zip -r downloads downloads/

mv downloads/ $direction



