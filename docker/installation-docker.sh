#!/bin/bash

# Exit immediately if any command fails
set -e

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script using sudo."
    exit 1
fi

echo "========== Updating Package List =========="
apt-get update

# (Optional) Upgrade installed packages
# Uncomment the line below if you want to update your entire system.
# apt-get upgrade -y

echo "========== Removing Old Docker Packages =========="
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    apt-get remove -y "$pkg" || true
done

echo "========== Installing Required Packages =========="
apt-get install -y ca-certificates curl

echo "========== Adding Docker GPG Key =========="
install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| tee /etc/apt/keyrings/docker.asc > /dev/null

chmod a+r /etc/apt/keyrings/docker.asc

echo "========== Adding Docker Repository =========="
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
> /etc/apt/sources.list.d/docker.list

echo "========== Updating Package List =========="
apt-get update

echo "========== Installing Docker =========="
apt-get install -y \
docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin

echo "========== Starting Docker Service =========="
systemctl enable docker
systemctl start docker

echo "========== Docker Installed Successfully =========="
docker --version
docker compose version

echo "========================================="
echo "Docker installation completed successfully!"
echo "========================================="