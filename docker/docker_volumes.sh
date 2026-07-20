#!/bin/bash

# ==========================================================
# Docker Volumes - Notes
# ==========================================================

# ----------------------------------------------------------
# What is a Docker Volume?
# ----------------------------------------------------------

# A Docker Volume is a persistent storage location managed by Docker.
#
# It stores data outside the container, so your data remains safe even if
# the container is stopped, removed, or recreated.
#
# Example:
# - MongoDB stores its database files inside /data/db.
# - If /data/db is connected to a Docker volume, all database data is
#   stored inside the volume.
# - Removing the MongoDB container DOES NOT remove the database data.
#
# Flow:
#
#   Container  --->  Volume  --->  Data
#
# Containers are temporary.
# Volumes are permanent until you delete them.


# ==========================================================
# Common Docker Volume Commands
# ==========================================================

# List all Docker volumes
docker volume ls

# Inspect a specific volume
docker volume inspect <volume_name>

# Example
docker volume inspect curd-mern_mongo-crud-app


# Create a new volume
docker volume create <volume_name>

# Example
docker volume create mongo-data


# Remove a specific volume
# (The volume must NOT be attached to a running container.)
docker volume rm <volume_name>

# Example
docker volume rm mongo-data


# Remove all unused volumes
docker volume prune


# Remove all volumes
# (Containers using these volumes must be removed first.)
docker volume rm $(docker volume ls -q)


# ==========================================================
# Where are Docker Volumes Stored?
# ==========================================================

# Check Docker's root directory
docker info | grep "Docker Root Dir"

# Inspect a volume to see its location
docker volume inspect <volume_name>

# Example output
#
# Mountpoint:
# /var/lib/docker/volumes/mongo-data/_data
#
# This directory contains the actual files stored by the volume.


# ==========================================================
# Docker Compose Example
# ==========================================================

# docker-compose.yml

# services:
#   mongodb:
#     image: mongo:latest
#     volumes:
#       - mongo-data:/data/db
#
# volumes:
#   mongo-data:


# Explanation:
#
# mongo-data  -> Docker-managed volume
# /data/db    -> Directory inside the MongoDB container
#
# Docker automatically mounts the volume to /data/db.
# MongoDB stores all database files in this volume.


# ==========================================================
# Why Use Docker Volumes?
# ==========================================================

# ✔ Data persists after container removal.
# ✔ Best for databases (MongoDB, MySQL, PostgreSQL, Redis).
# ✔ Easy backup and restore.
# ✔ Can be shared between multiple containers if needed.
# ✔ Managed automatically by Docker.


# ==========================================================
# Important Notes
# ==========================================================

# - Containers are temporary.
# - Volumes are persistent.
# - Deleting a container DOES NOT delete its volume.
# - Deleting a volume permanently removes all stored data.
# - Docker automatically creates a volume if it does not exist.
```