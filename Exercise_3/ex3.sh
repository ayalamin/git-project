#!/bin/bash

declare -a arr
arr=( 0 0 0 0 0 0 0 0 0 0)

func_acount() {
numbers=("$@")
numbers_length=${#numbers[@]}
for (( i = 0; i < numbers_length; i++)); 
do
    string_tmp=${numbers[i]}
    ((int_tmp = string_tmp))
    arr[$int_tmp]=$((arr[$int_tmp] + 1))
done
} 

print_numeric_word() { 
case $1 in 
1) echo -n "one" ;;
2) echo -n "two" ;;
3) echo -n "three" ;;
4) echo -n "four" ;;
5) echo -n "five" ;;
6) echo -n "six" ;;
7) echo -n "seven" ;;
8) echo -n "eight" ;;
9) echo -n "nine" ;;
10) echo -n  "ten" ;;
*) echo "unknown" ;;
esac
}

print_output() {
for (( i = 1; i <= 10; i++));
do
if [[ arr[$i] -gt 0 ]];
then
print_numeric_word "$i"
echo -n " appeared "
print_numeric_word "${arr[$i]}"
echo -n " times, "
fi     
done
}

main() {
numbers=("$@")
func_acount "${numbers[@]}"
print_output
}

main "$@"
