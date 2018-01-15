#Q11

# This funcion prints a string repeatlly
# parameters :
# $1 - String to repeat
# $2 - Times to repeat
echoTimes() {
    for ((k=0;k<$2;k++)) do
      echo -n $1    
    done
    echo
}

# Without array
for ((i=1;i<=10;i++)) do
    echo -n $i " "
    echoTimes X `cat $1 | grep -cw $i`
done
