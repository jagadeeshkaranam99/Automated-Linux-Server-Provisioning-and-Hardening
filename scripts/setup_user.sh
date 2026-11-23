#!/bin/bash
set -euo pipefail

USERNAME="${1:-devopsadmin}"
PUB_KEY="${2:-}"

if [ -z "$PUB_KEY" ]; then
  echo "Usage: sudo ./setup_user.sh <username> '<ssh-public-key>'"
  exit 1
fi

id -u "$USERNAME" &>/dev/null || useradd -m -s /bin/bash -G sudo "$USERNAME"
echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/$USERNAME"
chmod 0440 "/etc/sudoers.d/$USERNAME"

mkdir -p "/home/$USERNAME/.ssh"
echo "$PUB_KEY" > "/home/$USERNAME/.ssh/authorized_keys"
chmod 700 "/home/$USERNAME/.ssh"
chmod 600 "/home/$USERNAME/.ssh/authorized_keys"
chown -R "$USERNAME:$USERNAME" "/home/$USERNAME/.ssh"
echo "User $USERNAME provisioned with SSH key and sudo privileges."
