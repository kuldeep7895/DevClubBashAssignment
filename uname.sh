#! /bin/bash
if [ $# -eq 0 ]; 
then
    exit -1
fi
filename="$1"
while read -r line || [ -n "$line" ]; 
do
    IFS=":"
    read -ra mysplit <<< $line
    if [[ ${mysplit[0]} == "$2" ]]; 
    then
        echo ${mysplit[4]}
    fi
done < "$filename"
