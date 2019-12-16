#! /bin/bash
myvar=$( ls $1 )

if [ $? -ne 0 ]
then
  exit -1
fi

total_number1=$( ls $1 | wc -l )
total_number2=$( ls $2 | wc -l )
echo "Files copied from $1 to $2 are:"
a=1
count=0
while [ $a -lt $total_number1 ] || [ $a -eq $total_number1 ]
do
    count=0
    b=1
    while [ $b -lt $total_number2 ] || [ $b -eq $total_number2 ]
    do
        filename=$( ls $2 | head -$b | tail -1 )
        string=$( ls $1 | head -$a | tail -1 )
        if [ $filename = $string ]; then
            count=`expr $count + 1`
        fi
        b=`expr $b + 1`
    done
    if [ $count -eq 0 ]; then
        cp -r $1/$( ls $1 | head -$a | tail -1 ) $2
        echo $( ls $1 | head -$a | tail -1 )
    fi 
    a=`expr $a + 1`    
done

echo "Files copied from $2 to $1 are:"
a=0
count=0
while [ $a -lt $total_number2 ] || [ $a -eq $total_number2 ]
do
    count=0
    b=0
    while [ $b -lt $total_number1 ] || [ $b -eq $total_number1 ]
    do
        filename=$( ls $1 | head -$b | tail -1 )
        string=$( ls $2 | head -$a | tail -1 )
        if [[ $filename == $string ]]; then
            count=`expr $count + 1`
        fi
        b=`expr $b + 1`
    done
    if [ $count -eq 0 ]; then
        cp -r $2/$( ls $2 | head -$a | tail -1 ) $1
        echo $( ls $1 | head -$a | tail -1 )
    fi 
    a=`expr $a + 1`    
done