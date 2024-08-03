#!/bin/bash
set -e

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/jilund/proxmox-helpers/main/import-ssh-keys.sh)"

# apt update
# apt install ssh-import-id -y
# ssh-import-id-gh jilund

# list of container ids we need to iterate through
containers=$(pct list | tail -n +2 | cut -f1 -d' ')

function run_in_container() {
  container=$1
  echo "Adding SSH key to container $container"
  pct exec "$container" -- bash -c "apt update && apt install ssh-import-id -y && ssh-import-id-gh 'jilund'"
}

for container in $containers
do
  status="pct status $container"
  if [ "$status" == "status: running" ]; then
    run_in_container "$container"
  fi
done; wait