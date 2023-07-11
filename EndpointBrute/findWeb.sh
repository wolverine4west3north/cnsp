#!/bin/bash

# Set the file to read.
file="directorySearch.txt"

url=$1
url+="/"

# Loop through the lines in the file.
while read line; do

  line=""$url"$line"
  # Print the line.
  headers=$(curl -sI "$line" | grep -E '^HTTP/1.[0-9] \d{3}|Content-Type:' | sed 's/.*:\s//')
  if [[ $headers =~ "404" ]]; then
  echo "404"
  else
   echo "$line"
  fi
done < "$file"