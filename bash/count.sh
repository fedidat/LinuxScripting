options=`echo "$*" | grep -o '-' | wc -l`
parameters=`expr $# - $options`
echo options: $options
echo parameters: $parameters