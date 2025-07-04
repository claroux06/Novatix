#!/bin/bash
IP="$1"
LOG_FILE="/var/ossec/logs/active-responses.log"
echo "$(date) Blocking IP: $IP" >> $LOG_FILE
if command -v firewall-cmd >/dev/null; then
  firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='$IP' reject"
  firewall-cmd --reload
elif command -v iptables >/dev/null; then
  iptables -I INPUT -s "$IP" -j DROP
fi
