# Use the official NGINX base image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy website files to the container
COPY ./website/ /usr/share/nginx/html/

# Expose port 8080
EXPOSE 8080

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
