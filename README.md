# Docker Nginx Entrypoint Script

This repository contains a simple bash script `entrypoint.sh` designed to be the entrypoint for a Docker container running Nginx. This script is intentionally straightforward and offers a foundation for learning Docker and Kubernetes patterns, which can be expanded upon to cover different use cases.

## How it Works

The script starts an Nginx process in the background. It then gets the process ID of this process and enters into a while loop, where it checks various environment variables that could influence the behaviour of the script. Depending on the value of these environment variables, it performs different actions such as simulating a failure, changing the background color of the webpage or creating a ready file after some time.

Finally, it kills the original Nginx process and starts a new one. This is done to keep the shell open, unless it crashes.

Additional features are planned for the near future.  A guide on how to set the appropriate enviornment variables will also be included.

## How to Use

This script is designed to work with a Dockerfile that sets it as the entrypoint.

This Dockerfile performs the following actions:
1. Uses the latest version of the Nginx image.
2. Sets the working directory in the container.
3. Copies your web files from your local directory (`./html/`) into the appropriate directory in the container.
4. Copies the entrypoint script into the `/opt/` directory in the container.
5. Makes the entrypoint script executable.
6. Sets the entrypoint script as the entrypoint for the container.

The Docker container can be built and run using standard Docker commands. Once the container is running, the behaviour can be influenced using the environment variables mentioned in the script.

## Disclaimer

Remember, this script is a learning tool and is intentionally simplified to facilitate understanding. Always consider the requirements and constraints of your actual use case when developing production-ready scripts and Dockerfiles.
