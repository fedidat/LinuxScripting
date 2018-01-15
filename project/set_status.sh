#!/bin/bash
. "config.sh"

user="$(getFullUserName $USER)"
inbox_index="$MAIL_DIR/$user/$INBOX_INDEX"

linenumber=`expr $1 \* 3`
sed -i "${linenumber}s/.*/$2/" "$inbox_index"

