#! /bin/bash
if [ $# -eq 0 ]; 
then
    exit -1
fi
filename="$1"
var=0
while read -r line || [ -n "$line" ]; 
do
    IFS=" "
    read -ra mysplit <<< $line
    myvar=${mysplit[0]}
    for db in "${mysplit[@]}"; do
       if [[ $db = *"+"* ]]; then
            var=`expr $var + $myvar`
        elif [[ $db = *"-"* ]]; then
            var=`expr $var - $myvar`
        elif [[ $db = *"*"* ]]; then
            var=`expr $var \* $myvar`
        elif [[ $db = *"%"* ]]; then
            var=`expr $var % $myvar`
        elif [[ $db = *"/"* ]]; then
            var=`expr $var / $myvar`   
       fi

    done
done < "$filename"
echo $var
