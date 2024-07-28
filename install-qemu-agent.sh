#!/bin/sh

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/jilund/proxmox-helpers/main/install-qemu-agent.sh)"

set -e

apt update
apt -y install qemu-guest-agent 
systemctl enable qemu-guest-agent
systemctl start qemu-guest-agent
systemctl status qemu-guest-agent
