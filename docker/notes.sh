#!/bin/bash

############################################################
#           BUILD DOCKER IMAGE WITH TIMESTAMP TAG
############################################################

# Create a variable named VERSION.
# The date command generates the current date and time.
# Format:
# %Y = Year (2026)
# %m = Month (07)
# %d = Day (09)
# %H = Hour (24-hour format)
# %M = Minutes
# %S = Seconds
#
# Example Output:
# 20260709-144422
#
# This timestamp is used as the Docker image tag so
# every build has a unique version.

VERSION=$(date +"%Y%m%d-%H%M%S")

# Build a Docker image.
# -t = Assign a name and tag to the image.
#
# Image Name : dockerbasics-html
# Tag        : Value stored in $VERSION
#
# Example:
# dockerbasics-html:20260709-144422

docker build -t dockerbasics-html:$VERSION .

# Display the image name and tag after a successful build.

echo "Image = dockerbasics-html:$VERSION"