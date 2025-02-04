# # # # FROM node:16-alpine

# # # # WORKDIR /app

# # # # COPY package*.json ./
# # # # RUN npm install

# # # # COPY . .
# # # # RUN npm run build # Or your backend build command

# # # # CMD ["npm", "start"] # Or your backend start command

# # # # EXPOSE 3000

# # # # Replace with your appropriate base image and commands
# # # FROM node:16
# # # WORKDIR /app
# # # COPY package*.json ./
# # # RUN npm install
# # # COPY . .
# # # CMD ["npm", "start"]

# # FROM node:16-alpine 

# # WORKDIR /app

# # COPY package*.json ./
# # RUN npm ci --only=production

# # COPY . .
# # RUN npm run build 

# # CMD ["npm", "start"] 

# # EXPOSE 3000

# # FROM node:16-alpine
# # WORKDIR /app
# # COPY package*.json ./
# # RUN npm ci --only=production
# # COPY . .
# # CMD ["npm", "start"] # Or your actual start command
# # EXPOSE 4000

# # Use a supported Node.js base image
# FROM node:24

# # Set the working directory in the container
# WORKDIR /app

# # Copy package.json and package-lock.json (if it exists)
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of your application code
# COPY . .

# # Expose the port your app listens on
# EXPOSE 4000

# # Define the command to start your app
# CMD ["node", "server.js"]

# Use a slim base image for smaller size and faster startup
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy application code
COPY . .

# Build the application (if necessary)
RUN npm run build

# Set the port your app listens on
ENV PORT 4000

# Start the application
CMD ["npm", "start"]

# Expose the port
EXPOSE 4000