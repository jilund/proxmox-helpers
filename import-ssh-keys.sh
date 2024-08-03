#!/bin/bash
set -e

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/jilund/proxmox-helpers/main/import-ssh-keys.sh)"

apt update
apt install ssh-import-id -y
ssh-import-id-gh jilund

# if grep -Fxq "$KEY" ~/.ssh/authorized_keys
# then
#     echo "Key already exists"
# else
#     echo "Key does not exist"
#     echo "$KEY" >> ~/.ssh/authorized_keys
# fi