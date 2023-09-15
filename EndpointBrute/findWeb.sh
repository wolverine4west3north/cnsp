#!/bin/bash

# Set the file to read.
file="directorySearch.txt"

url=$1
url+="/"

# Loop through the lines in the file.
while read line; do

  line=""$url"$line"
  # Print the line.
  headers=$(curl -sI "$line")
  if [[ $headers =~ "404" || $headers =~ "400" ]]; then
  echo "404"
  else
   echo "$headers"
  fi
done < "$file"