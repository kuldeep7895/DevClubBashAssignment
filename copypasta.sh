#! /bin/bash
if [ $# -eq 0 ]; 
then
    exit -1
fi
filename="$1"
name=""
while read -r line || [ -n "$line" ]; 
do
    if [[ $line == *"<name"* ]]; then
        pos1=`expr index "$line" =`
        pos1=$(( $pos1 + 1 ))
        pos2=`expr index "$line" \>`
        echo $pos2
        pos2=$(( $pos2 - 2 ))
        pos2=$(( $pos2 - $pos1 ))
        name=${line:$pos1:$pos2}
    fi
done < "$filename"
sed -i 's/'$name'/'$2'/g' $1
