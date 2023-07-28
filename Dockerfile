# Use nginx base image
FROM nginx:latest

# Set working directory for the web files
WORKDIR /usr/share/nginx/html

# Copy your web files into the appropriate directory in the container
COPY ./html/ .

# Copy your entrypoint script into the container in a different directory
COPY ./entrypoint.sh /opt/

# Give executable permissions to your entrypoint script
RUN chmod +x /opt/entrypoint.sh

# Use your custom script as the entrypoint
ENTRYPOINT ["/bin/bash", "/opt/entrypoint.sh"]
