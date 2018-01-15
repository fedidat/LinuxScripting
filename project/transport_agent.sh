#!/bin/bash
. "config.sh"

user="$(getFullUserName $USER)"
outbox_full="$MAIL_DIR/$user/$OUTBOX"
awk -f ./transport_agent.awk mail_dir="$MAIL_DIR" me="$user" inbox="$INBOX" inbox_index="$INBOX_INDEX" "$outbox_full"
> "${outbox_full}"
