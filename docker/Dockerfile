
FROM nginx:latest

# Copy the local default.conf to the nginx container
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy the local index.html to the nginx container
COPY html/index.html /usr/share/nginx/html/index.html

# Expose port 80 to the Docker host
EXPOSE 80

# CMD instruction to start NGINX 
CMD ["nginx", "-g", "daemon off;"]
