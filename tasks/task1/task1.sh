#!/bin/bash

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <directory> <output_file>"
  exit 1
fi

# Assign the command-line arguments to variables
directory="$1"
output_file="$2"

# Function to check available disk space
check_disk_space() {
  disk_space=$(df -h)
  echo -e "Disk Space status of $directory:\n$disk_space\n" >> "$output_file"
}

# Function to list files in the specified directory
list_files() {
  files_list=$(ls -l "$directory")
  echo -e "Files of $directory:\n$files_list\n" >> "$output_file"
}

# Function to retrieve the system's public IP address
get_public_ip() {
  public_ip=$(curl -s https://ipinfo.io/ip)
  echo -e "Public Ip Address: $public_ip\n" >> "$output_file"
}

# Run the functions
echo -e "$(date)\n" >> "$output_file"
check_disk_space
list_files
get_public_ip