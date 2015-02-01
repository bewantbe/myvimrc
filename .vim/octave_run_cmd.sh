#!/bin/bash
# send current file name as command to
# the most recent attached screen session

GEDIT_CURRENT_DOCUMENT_NAME=$1

echo "aha"
a=`which tmux`
if [ -z "$a" ]; then
  notify-send '"tmux" not found'
  exit
fi
# get name(id) of most resent session
a=`tmux list-clients -F"#{client_activity} #{session_name}" | sort -r | head -n 1`
if [ "$a" ]; then
  a=`echo "$a" | cut -d ' ' -f 2`
  keys=`basename $GEDIT_CURRENT_DOCUMENT_NAME .m`
  tmux send-keys -t $a: $"$keys
"
else
  notify-send "No attached tmux session found"
fi

