#!/bin/bash
. "config.sh"

my_outbox="$MAIL_DIR/$(getFullUserName $USER)/$OUTBOX"
echo $1 >> "$my_outbox"
date >> "$my_outbox"
cat $2 | wc -l >> "$my_outbox"  
cat $2 >> "$my_outbox"
