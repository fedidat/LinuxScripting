print() {
    echo The time now is $1 o\'clock, $2 minutes and $3 seconds
}

print `date | tr -s " "| cut -d ' ' -f4 | sed 's/:/ /g'`

