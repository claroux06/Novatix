#!/bin/bash
USER="$1"
LOG_FILE="/var/ossec/logs/active-responses.log"
if id "$USER" &>/dev/null; then
  usermod -L "$USER"
  echo "$(date) Disabled user: $USER" >> $LOG_FILE
fi
