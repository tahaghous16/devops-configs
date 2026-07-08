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