#!/bin/bash
. "config.sh"

createLibrary() {
  if ! [ -d "$MAIL_DIR" ]; then
    mkdir -p "$MAIL_DIR"
    chmod 777 "$MAIL_DIR"
  fi
  mkdir -p "$MAIL_DIR/$1"
  touch "$MAIL_DIR/$1/$INBOX"  
  touch "$MAIL_DIR/$1/$INBOX_INDEX"
  touch "$MAIL_DIR/$1/$OUTBOX"
  chmod -R 777 "$MAIL_DIR/$1"
 }

if [ $# -eq 0 ]
  then
    user=$(getFullUserName $USER)
    createLibrary "$user"
else
 createLibrary "$1"
fi
