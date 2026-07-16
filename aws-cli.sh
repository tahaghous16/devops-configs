#!/bin/bash

# ============================================================
# AWS CLI Cheat Sheet
# ============================================================

# ------------------------------------------------------------
# 1. Check AWS CLI Version
# ------------------------------------------------------------
aws --version


# ------------------------------------------------------------
# 2. Install AWS CLI (Ubuntu)
# ------------------------------------------------------------

# Update package index
sudo apt update

# Install unzip
sudo apt install unzip -y

# Download AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Extract the installer
unzip awscliv2.zip

# Install AWS CLI
sudo ./aws/install

# Verify installation
aws --version


# ------------------------------------------------------------
# 3. Configure Default Profile
# ------------------------------------------------------------
aws configure


# ------------------------------------------------------------
# 4. Configure a Named Profile
# ------------------------------------------------------------
aws configure --profile dev


# ------------------------------------------------------------
# 5. List All Profiles
# ------------------------------------------------------------
aws configure list-profiles


# ------------------------------------------------------------
# 6. Show Current Configuration
# ------------------------------------------------------------
aws configure list


# ------------------------------------------------------------
# 7. Get Current Region
# ------------------------------------------------------------
aws configure get region


# ------------------------------------------------------------
# 8. Change Default Region
# ------------------------------------------------------------
aws configure set region ap-southeast-1


# ------------------------------------------------------------
# 9. Verify Credentials
# ------------------------------------------------------------
aws sts get-caller-identity


# ------------------------------------------------------------
# 10. Use a Specific Profile
# ------------------------------------------------------------
aws s3 ls --profile dev


# ------------------------------------------------------------
# 11. Set Profile for Current Terminal Session
# ------------------------------------------------------------
export AWS_PROFILE=dev

# Check active profile
echo $AWS_PROFILE

# Remove active profile
unset AWS_PROFILE


# Make the custom profile the default permanently
# example:
echo 'export AWS_PROFILE=taha-cli' >> ~/.bashrc
source ~/.bashrc


# ------------------------------------------------------------
# 12. View AWS Credentials File
# ------------------------------------------------------------
cat ~/.aws/credentials


# ------------------------------------------------------------
# 13. View AWS Config File
# ------------------------------------------------------------
cat ~/.aws/config


# ------------------------------------------------------------
# 14. Edit Credentials File
# ------------------------------------------------------------
nano ~/.aws/credentials


# ------------------------------------------------------------
# 15. Edit Config File
# ------------------------------------------------------------
nano ~/.aws/config


# ------------------------------------------------------------
# 16. Delete a Profile
# ------------------------------------------------------------
# AWS CLI has NO command to delete a profile.
# Remove the profile manually from:
#
# ~/.aws/credentials
# ~/.aws/config
#
# Example:
#
 nano ~/.aws/credentials
 nano ~/.aws/config
#
# Delete the corresponding profile section and save.
# ------------------------------------------------------------