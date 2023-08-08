#!/bin/bash

# the function print decimal value of a letter
print_decimal() {
        local letter="$1"
        if [ -z "$letter" ] || [ ! "$letter" = " " ]; then
        local decimal=$(printf '%d' "'$letter")
        echo "$letter = $decimal"
        sum=$((sum + decimal))
        fi
}

main() {
        # initialize sum
        sum=0

        # check if arguments were provided
        if [ $# -gt 0 ]; then
                # loop through command-line arguments
                for arg in "$@"; do
                        print_decimal "$arg"
                done
        #read letters from user input
        else
                read -p "enter alphabetical letters: " letters
                for ((i = 0; i < ${#letters}; i++)); do
			letter="${letters:i:1}"
			print_decimal "$letter"
                done
        fi

        #print sum
        echo "sum of decimal value: $sum"
}

#call the main function
main "$@"
