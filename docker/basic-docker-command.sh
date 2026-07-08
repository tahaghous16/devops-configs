docker pull <image>          # Download an image
docker build -t <image> .    # Build an image from Dockerfile
docker run <image>           # Create and start a container
docker ps                    # Show running containers
docker ps -a                 # Show all containers
docker images                # Show local images
docker stop <container>      # Stop a container
docker start <container>     # Start a stopped container
docker rm <container>        # Remove a container
docker rmi <image>           # Remove an image
docker exec -it <container> /bin/sh   # Enter a running container
docker logs <container>      # View container logs
docker inspect <container>   # View detailed configuration



###########################################################
#           BASIC DOCKERFILE COMMANDS (NOTES)
###########################################################

#  ------ FROM -----
# Specifies the base image for your custom image.
# Example:
FROM nginx:alpine

#  ------ LABEL -----
# Adds metadata such as author or version.
# Example:
LABEL author="Taha"

#  ------ WORKDIR -----
# Sets the current working directory inside the image.
# If the directory doesn't exist, Docker creates it.
# Example:
WORKDIR /app

# -------- COPY -------
# Copies files from the host machine into the image.
# Example:
COPY . .

# --------- ADD -------
# Similar to COPY but can extract archives and download URLs.
# COPY is recommended for most use cases.
# Example:
ADD app.tar.gz /app

#  -------- RUN ---------
# Executes commands while building the image.
# Creates a new image layer.
# Example:
RUN apt-get update && apt-get install -y curl

#  --------- ENV ---------
# Sets environment variables.
# Example:
ENV PORT=8000

#  ---------- EXPOSE -------
# Documents the port used by the application.
# Example:
EXPOSE 80

# ----------- CMD ---------
# Default command executed when the container starts.
# Example:
CMD ["nginx","-g","daemon off;"]

# ----------- ENTRYPOINT -------
# Defines the main executable of the container.
# Example:
ENTRYPOINT ["python"]

#  ------------ USER ----------
# Runs the container as a specific user.
# Example:
USER appuser

#  ------------- VOLUME ---------
# Creates a mount point for persistent data.
# Example:
VOLUME ["/data"]

#  -------------- ARG ------------
# Defines a build-time variable.
# Example:
ARG VERSION=1.0

###########################################################
# Learning Order:
# 1. FROM
# 2. WORKDIR
# 3. COPY
# 4. RUN
# 5. EXPOSE
# 6. CMD
# 7. ENV
# 8. ENTRYPOINT
# 9. USER
# 10. VOLUME
# 11. ARG
###########################################################