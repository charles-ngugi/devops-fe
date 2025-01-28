# Build Stage
FROM node:20-alpine as build

WORKDIR /app

COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# Build React app
RUN npm run build

# Production Stage
FROM nginx:alpine

# Copy only the build folder from the build stage to the nginx container
COPY --from=build /app/build /usr/share/nginx/html

# Expose the port that the app will run on
EXPOSE 80

# Start nginx to serve the React app
CMD ["nginx", "-g", "daemon off;"]

