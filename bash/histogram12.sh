#Q12

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

if [ "$#" != 3 ] || [ "$2" -lt 1 ] || [ "$3" -gt 10 ] || [ "$3" -lt "$2" ] ; then
echo bad
exit 1
fi

# Without array
for ((i=$2;i<=$3;i++)) do
    echo -n $i " "
    echoTimes X `cat $1 | grep -cw $i`
done

# With array
declare -a hist
for ((i=$2;i<=$3;i++)) do
    num[i]=`cat $1 | grep -cw $i`
done

for ((i=$2;i<=$3;i++)) do
    echo -n $i " "
    echoTimes X ${num[i]}
done
