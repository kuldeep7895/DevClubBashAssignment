#! /bin/bash
myvar=$( ls $1 )

if [ $? -ne 0 ]
then
  exit -1
fi

total_number=$( ls $1 | wc -l )
a=0
count=0
while [ $a -lt $total_number ]
do
    string=$( ls $1 | head -$a | tail -1 )
    if [[ $string == *"$2"* ]]; then
        count=`expr $count + 1`
    fi
    a=`expr $a + 1`
done
echo $count
