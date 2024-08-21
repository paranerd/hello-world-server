# Use the latest LTS version of Node.js as the base image
FROM node:lts-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Expose the port the application will listen on
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
