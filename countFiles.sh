#! /bin/bash
myvar=$( ls $1 )
total_number=$( ls $1 | wc -l )
a=0
count=0
while [ $a -lt $total_number ]
do
    string=$( ls /tmp/dir$ | head -$a | tail -1 )
    if [[ $string == *"$2"* ]]; then
        count=`expr $count + 1`
    fi
    a=`expr $a + 1`
done
echo $count