FROM ubuntu:latest

# Set the working directory
WORKDIR /Users/LEE/Fitness_Project/energym-html

# Copy the index.html file to the working directory
COPY . .

# Install nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean && rm -rf /var/lib/apt/lists/*

# Remove the default nginx site configuration
RUN rm /etc/nginx/sites-enabled/default

# Create a new nginx site configuration
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    location / { \
        root /Users/LEE/Fitness_Project/energym-html; \
        index index.html; \
    } \
}' > /etc/nginx/sites-available/default

# Enable the new nginx site configuration
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
