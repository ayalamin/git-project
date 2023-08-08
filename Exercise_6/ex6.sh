#!/bin/bash

declare -gA USERS

declare_users() {
  row=$1
  username=$2
  userid=$3
  groupid=$4
  user_info=$5
  homedir=$6
  password=$7

  USERS["$row,username"]=$username
  USERS["$row,userid"]=$userid
  USERS["$row,groupid"]=$groupid
  USERS["$row,user_info"]=$user_info
  USERS["$row,homedir"]=$homedir
  USERS["$row,password"]=$password
}

# Check if the script is run with superuser (sudo) privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "This script requires superuser (sudo) privileges. Please run it as a superuser."
  exit 1
fi

# Define the path to the system users file
users_file="/etc/passwd"

# Check if the system users file exists
if [ ! -f "$users_file" ]; then
  echo "The system users file $users_file does not exist."
  exit 1
fi

# Display user details header
printf "%-7s %-25s %-10s %-10s %-35s %-30s %-15s\n" "Index" "Username" "UserID" "GroupID" "User Info" "Home Directory" "Password"

idx=1

while IFS=: read -r username password userid groupid user_info homedir shell; do
  declare_users "$idx" "$username" "$userid" "$groupid" "$user_info" "$homedir" "$password"
  ((idx++))
done < "$users_file"

# Display user details!
for ((i = 1; i < idx; i++)); do
  printf "%-7s %-25s %-10s %-10s %-35s %-30s %-15s\n" "$i" \
    "${USERS[$i,username]}" "${USERS[$i,userid]}" "${USERS[$i,groupid]}" \
    "${USERS[$i,user_info]}" "${USERS[$i,homedir]}" "${USERS[$i,password]}"
done

