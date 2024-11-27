# Use Node.js 20 as base image for building
FROM node:20 AS build-env

# Copy the application coe
COPY . /app

# Set the working directory
WORKDIR /app

# Install dependencies
RUN npm ci --omit=dev

# Use distroless Node 20 as base image for production
FROM gcr.io/distroless/nodejs20-debian12

# Copy artifacts from build stage
COPY --from=build-env /app /app

# Set the working directory
WORKDIR /app

# Expose the port the application will listen on
EXPOSE 8080

# Run the app
CMD ["src/index.js"]
