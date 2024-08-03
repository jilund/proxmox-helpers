#!/bin/bash

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/jilund/proxmox-helpers/main/configure-rsyslog.sh)"

set -e
# Remote syslog server

REMOTE_SYSLOG_SERVER="syslog.qnet.se:514"

# Define the file path
FILE_PATH="/etc/rsyslog.d/10-remote-syslog.conf"

apt update
apt -y apt install rsyslog

# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  # If the file does not exist, create it and write the variable to it
  echo "*.*  @$REMOTE_SYSLOG_SERVER" > "$FILE_PATH"
else
  echo "Config file already exists. Skipping."
fi

# Open the config and do changes if needed

nano /etc/rsyslog.conf

echo "Restarting rsyslog service"
service rsyslog restart
service rsyslog status