#!/bin/bash
. "config.sh"
countFilesSize() {
# Iterates each line in a users library and sums its files
while read -r line
do
  size=`echo $line | tr -s " " | cut -d" " -f5` 
  sum=`expr $sum + $size`
done < <( ls -l "$1" | sed 1d) # This is what we iterating on
echo $2 $sum
}

while read -r usr
do
  i=`expr $i+1`
  all[$i]=$(countFilesSize "$MAIL_DIR/$usr" "$usr")
done < <(ls -1 $MAIL_DIR)

for user in "${all[@]}"
do
echo "$user"
done | sed 's/\(.*\) /\1:/' | sort -n -t: -k2 | sed 's/:/ /'



