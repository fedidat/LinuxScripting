export MAIL_DIR=/tmp/mail
export INBOX=inbox
export INBOX_INDEX=inbox_index
export OUTBOX=outbox

getFullUserName() {
  echo `grep $1 /etc/passwd | cut -d: -f5`
}

export FULL_INBOX="$MAIL_DIR/$(getFullUserName $USER)/$INBOX"
export FULL_INBOX_INDEX="$MAIL_DIR/$(getFullUserName $USER)/$INBOX_INDEX"

